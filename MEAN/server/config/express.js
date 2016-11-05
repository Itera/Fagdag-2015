var morgan = require('morgan'),
	bodyParser = require('body-parser'),
	passport = require('passport'),
	express = require('express');

module.exports = function() {
	var app = express();

	if (process.env.NODE_ENV === 'development') {
		app.use(morgan('dev'));
	}

	app.use(bodyParser.urlencoded({
		extended: true
	}));

	app.use(bodyParser.json());

	app.use(passport.initialize());
	app.use(passport.session());

	app.set('views', './server/views');
	app.set('view engine', 'ejs');

	// Router
	app.use('/', require('../routes'));

	app.use(express.static('./public'));

	return app;
}
