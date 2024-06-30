require("./config/db");
require("./config/passport.google.setup");
require("./config/passport.facebook.setup");

const port = process.env.PORT || 3000;
const express = require("express");
const path = require("path");
const helmet = require("helmet");
const bodyParser = require("body-parser");
const cookieParser = require('cookie-parser');
const cors = require("cors");
const passport = require("passport");
const session = require("express-session");
const rateLimit = require('express-rate-limit')
const mongoSanitize = require('express-mongo-sanitize')
const xss = require('xss-clean')

const errorController = require("./controllers/error.controller");
const AppError = require("./utils/appError");
const { ERROR } = require("./utils/httpStatusText");
const authRouter = require("./routes/auth.router");
const userRouter = require("./routes/user.router");
const authCW = require("./routes/authCW.router");
const userInfoRouter = require("./routes/userInfo.route");
const vitalsignalRouter = require("./routes/vitalSig.route");
<<<<<<< HEAD
const activityRouter = require("./routes/activity.router");
=======
>>>>>>> parent of ff3a7fc (change)

const app = express();
app.use(cookieParser());


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

const limitar = rateLimit({
  max: 100,
  windowMs: 60 * 60 * 1000,
  message: 'Too many requests from this IP, please try again in an hour!'
})



app.use(passport.initialize());
app.use(passport.session());

app.use(cookieParser());
app.use(express.static(path.join(__dirname, "images")));
app.use(express.json({ limit : '10kb'}));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cors());
app.use(helmet());
app.use('/api',limitar);
app.use(mongoSanitize());
app.use(xss());

app.use("/home", (req, res, next) => {
  res.send("<h1>home screen</h1>");
});

app.use("/api/auth", authRouter);
app.use("/api/user", userRouter);
app.use("/auth", authCW);
app.use("/api/userInfo", userInfoRouter);
app.use("/api/vitalsignal", vitalsignalRouter);
<<<<<<< HEAD
app.use("/api", activityRouter);
=======

>>>>>>> parent of ff3a7fc (change)

app.use("/hello-world", (req, res, next) => {
  res.send("Hello World");
});

app.all("*", (req, res, next) => [
  next(AppError.create("Page not found", ERROR, 404)),
]);

app.use(errorController);

app.listen(port, () => {
  console.log("server running.......");
});
