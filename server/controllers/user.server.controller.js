var User = require('mongoose').model('User');

exports.list = function (req, res) {
    User.find({},'firstName lastName email role', function (err, users) {
        if (err) {
            var error = {
                message: getErrorMessage(err)
            };
            res.status(500).send(error);
        }
        else {
            res.status(200).send(users);
        }
    });
};

exports.create = function (req, res) {
	console.log(req.body);
	var userModel = new User(req.body);

	userModel.save(function (err, user) {
		if (err) {
			res.status(400).send(err);
		}

		else if (!user) {
			res.status(400).send({
				message: 'Could not find user'
			});
		}
		else {
			res.status(200).send(user);
		}
	});
}
