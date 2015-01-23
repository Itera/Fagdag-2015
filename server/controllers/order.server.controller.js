exports.load = function(req, res, next, id) {
  req.order = {
    name: 'Order'
  };
  next();
};

exports.retrieve = function(req, res) {
  res.status(200).json(req.order);
};

exports.create = function(req, res) {
  res.status(201).json({
    message: 'Skal lage ordre'
  });
};
