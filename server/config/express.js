var morgan = require('morgan'),
	bodyParser = require('body-parser'),
	express = require('express'),
	routes = require('../routes');

module.exports = function() {
	var app = express();

	if (process.env.NODE_ENV === 'development') {
		app.use(morgan('dev'));
	}

	app.use(bodyParser.urlencoded({
		extended: true
	}));

	app.use(bodyParser.json());

	app.set('views', './server/views');
	app.set('view engine', 'ejs');

	// Router
	app.use('/', routes);

	app.use(express.static('./public'));

	return app;
}
