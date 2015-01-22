var user = require('../controllers/user.server.controller');

module.exports = function (app) {
	app.route('/api/users')
		.get(user.list)
		.post(user.create);
}