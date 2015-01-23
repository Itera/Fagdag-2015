var nodemailer = require('nodemailer');
var Product = require('mongoose').model('Product');

var transporter = nodemailer.createTransport({
    service: 'Gmail',
    auth: {
        user: 'itera.shoebaloo@gmail.com',
        pass: process.env.GMAIL_PASSWORD
    }
});

exports.sendRegisterConfirmation = function(user) {
  var mail = 'Hi ' + user.firstName + ', and welcome to Shoebaloo!\n';
  mail += 'For any questions, feel free to contact support@shoebaloo.com.\n';

  var mailOptions = {
    from: 'Shoebaloo <no-reply@shoebaloo.no>',
    to: user.email,
    subject: 'Welcome to Shoebaloo',
    text: mail
  };

  transporter.sendMail(mailOptions, function(err, info) {
    if (err) return console.log('Error sending mail', err);
    console.log('Email sent', info.response);
  });
};

exports.sendOrderConfirmation = function(order, user) {
  var mail = 'Thank you for your order!\n\n';

  mail += 'Order summary:\n';

  order.products.forEach(function(obj) {
    console.log(obj);

    var item = obj.product;

    mail += '- ' + obj.quantity + 'x ' + item.name + ' by ' + item.brand + ' (' + item.price + ' kr)\n';
  });

  var mailOptions = {
    from: 'Shoebaloo <no-reply@shoebaloo.no>',
    to: user.email,
    subject: 'Order confirmation from Shoebaloo',
    text: mail
  };

  transporter.sendMail(mailOptions, function(err, info) {
    if (err) return console.log('Error sending mail', err);
    console.log('Email sent', info.response);
  });
};
