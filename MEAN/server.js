process.env.NODE_ENV = process.env.NODE_ENV || 'development';

var mongoose = require('./server/config/mongoose'),
	express = require('./server/config/express');

var db = mongoose(),
	app = express();

module.exports = app;

app.set('port', process.env.PORT || 3000);

app.listen(app.get('port'), function() {
	console.log('Server running on port ' +
				app.get('port') + 
				' , in ' + 
				process.env.NODE_ENV + 
				'!');
});