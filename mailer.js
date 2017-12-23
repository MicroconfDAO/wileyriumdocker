//npm start -- to@to.com "message" ["subject"]
require('nodemailer')
  .createTransport({
    service: 'gmail',
    auth: {
      user: 'wileyrium@gmail.com',
      pass: 'microconf57042'
    }
  })
  .sendMail({
    from: 'wileyrium@gmail.com',
    to: process.argv[2] || 'victornabatov@gmail.com',
    subject: process.argv[4] || 'Wileyrium / Notification',
    text: process.argv[3] || 'docker OK'
  }, function (error, info) {
    if (error) {
      console.log(error);
    } else {
      console.log('Email sent: ' + info.response);
    }
  });