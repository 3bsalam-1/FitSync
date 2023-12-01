const nodemailer = require("nodemailer");

const sendEmail = async (options) => {
  const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: process.env.EMAIL,
      pass: process.env.EMAIL_PASSWORD,
    },
  });
  const mailOption = {
    from: process.env.EMAIL,
    to: options.email,
    subject: options.subject,
    html: `<div style="text-align: center;">
            <h3>Hello ${options.username} </h3>
            <p>Please enter the following code for verification:</p>
            <h1 style="font-weight: bold; font-size: 32px;">${options.code}</h1>
            <p>The code will expire in 10 minutes</p>
        </div>`,
  };
  await transporter.sendMail(mailOption).catch((err) => {
    console.log(err);
  });
};

module.exports = sendEmail;
