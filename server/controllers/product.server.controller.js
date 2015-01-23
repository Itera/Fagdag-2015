exports.load = function(req, res, next, id) {
  req.product = {
    name: 'Skoen',
    pris: 1000
  };
  next();
};

exports.create = function(req, res) {
  res.status(201).json({
    name: 'Sko',
    price: 1000
  });
};

exports.list = function(req, res) {
  res.status(200).json({
    products: [
      {
        name: 'Sko',
        price: 1000
      }
    ]
  });
};

exports.retrieve = function(req, res) {
  res.status(200).json(req.product);
};

exports.delete = function(req, res) {
  res.status(200).json({
    message: 'Deleted product.'
  });
};

exports.update = function(req, res) {
  res.status(200).json({
    message: 'Updated product.'
  });
};
