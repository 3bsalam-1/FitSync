const jwt = require('jsonwebtoken');

const signToken = async (user, res) => {
  let token;
  const cookieOptions = {
    expires: new Date(
      Date.now() + process.env.JWT_COOKIE_EXPIRES_IN * 24 * 60 * 60 * 1000
    ),
    secure: true,
    httpOnly: true,
  };

  if (user.firstTime) {
    token = jwt.sign(
      { id: user._id, firstTime: user.firstTime },
      process.env.JWT_SECRET,
      { expiresIn: "1h" }
    );
  } else {
    token = jwt.sign(
      { 
        id: user._id,
        firstTime: user.firstTime,
        firstName: user.firstName,
        lastName: user.lastName,
        username: user.username, 
        email: user.email,
        avatar: user.avatar.url,
      },
      process.env.JWT_SECRET,
      {
        expiresIn: process.env.JWT_EXPIRES_IN,
      }
    );
  }

  res.cookie("jwt", token, cookieOptions);
  return token;
};

module.exports = {
  signToken,
};
