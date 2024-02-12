require("./config/db");
require("./config/passport.google.setup");
require("./config/passport.facebook.setup");

const port = process.env.PORT || 3000;
const express = require("express");
const path = require("path");
const helmet = require("helmet");
const bodyParser = require("body-parser");
const cors = require("cors");
const passport = require("passport");
const session = require("express-session");

const errorController = require("./controllers/error.controller");
const AppError = require("./utils/appError");
const { ERROR } = require("./utils/httpStatusText");
const authRouter = require("./routes/auth.router");
const authCW = require("./routes/authCW.router");
const userInfoRouter = require("./routes/userInfo.route");
const vitalsignalRouter = require("./routes/vitalSig.route");

const app = express();

app.use(
  session({
    resave: false,
    secret: process.env.JWT_SECRET,
    saveUninitialized: false,
    cookie: {
      maxAge: 30 * 24 * 60 * 60 * 1000,
    },
  })
);

app.use(passport.initialize());
app.use(passport.session());

app.use(express.static(path.join(__dirname, "images")));
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cors());
app.use(helmet());

app.use("/api/user", authRouter);
app.use("/auth", authCW);
app.use("/api/userInfo", userInfoRouter);
app.use("/api/vitalsignal", vitalsignalRouter);

app.all("*", (req, res, next) => [
  next(AppError.create("Page not found", ERROR, 404)),
]);

app.use(errorController);

app.listen(port, () => {
  console.log("server running.......");
});
