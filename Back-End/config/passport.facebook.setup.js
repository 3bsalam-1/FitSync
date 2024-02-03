const passport = require("passport");
const FacebookStrategy = require("passport-facebook").Strategy;

const User = require("../models/user.model");

passport.serializeUser((user, done) => {
  done(null, user._id);
});
passport.deserializeUser(async (id, done) => {
  const user = await User.findById(id);
  done(null, user);
});

passport.use(
  new FacebookStrategy(
    {
      clientID: process.env.clientFacebookID,
      clientSecret: process.env.clientFacebookSecret,
      profileFields: ["id", "displayName", "email"],
      callbackURL: "https://fitsync.onrender.com/auth/facebook/redirect",
    },
    async (accessToken, refreshToken, profile, done) => {
      let { name, id } = profile._json;
      let email = id;
      const currentUser = await User.findOne({ email });

      if (currentUser) {
        return done(null, currentUser);
      }

      const currentUserName = await User.findOne({ username: name });

      if (currentUserName) {
        const num = Math.floor(Math.random() * 100);
        name = name + num;
      }

      name = name.split(" ");
      firstName = name[0];
      lastName = name[1];
      name=name.join("");
      const newUser = new User({ username: name, email, isVerify: true });

      await newUser.save({ validateBeforeSave: false });
      return done(null, newUser);
    }
  )
);
