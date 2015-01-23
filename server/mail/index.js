var nodemailer = require('nodemailer');
var Product = require('mongoose').model('Product');

var transporter = nodemailer.createTransport({
    service: 'Gmail',
    auth: {
        user: 'itera.shoebaloo@gmail.com',
        pass: process.env.GMAIL_PASSWORD
    }
});

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
