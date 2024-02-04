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
    html:` <div style="margin:auto;max-width:600px;padding-top:50px">
        <table role="presentation" cellspacing="0" cellpadding="0" width="100%" align="center" style="background:#252f3d;border-radius:3px 3px 0 0;max-width:600px">
            <tbody><tr>
                <td style="background:#d9d7d3;border-radius:3px 3px 0 0;padding:20px 0 10px 0;text-align:center">
                    <img src="https://firebasestorage.googleapis.com/v0/b/fitsync-1d1c9.appspot.com/o/logo%2FComponent%209.png?alt=media&token=b28dcb93-c0e5-492b-b4a9-cff94d1a9b75" width="80" height="80" alt="FitSync logo" border="0" style="font-family:sans-serif;font-size:15px;line-height:140%;color:#555555">
                </td>
            </tr>
        </tbody></table>
        
        
        <table role="presentation" cellspacing="0" cellpadding="0" width="100%" align="center" style="border:0px;border-bottom:1px solid #d6d6d6;max-width:600px">
            <tbody><tr>
                <td style="background-color:#fff;color:#444;font-family:'Amazon Ember','Helvetica Neue',Roboto,Arial,sans-serif;font-size:14px;line-height:140%;padding:25px 35px">
                    <h1 style="font-size:20px;font-weight:bold;line-height:1.3;margin:0 0 15px 0">Hello ${options.username} verify your email address</h1>
                    <p style="margin:0;padding:0">We want to make sure it's really you. Please enter the following verification code when prompted. If you don’t want to create an account, you can ignore this message.</p>
                    <p style="margin:0;padding:0"></p>
                </td>
            </tr>
            <tr>
                <td style="background-color:#fff;color:#444;font-family:'Amazon Ember','Helvetica Neue',Roboto,Arial,sans-serif;font-size:14px;line-height:140%;padding:25px 35px;padding-top:0;text-align:center">
                    <div style="font-weight:bold;padding-bottom:15px">Verification code</div>
                    <div style="color:#000;font-size:36px;font-weight:bold;padding-bottom:15px">${options.code}</div>
                    <div>(This code is valid for 10 minutes)</div>
                </td>
            </tr>
            
        </tbody></table>
        
    </div>`
  };
  await transporter.sendMail(mailOption).catch((err) => {
    console.log(err);
  });
};

module.exports = sendEmail;
