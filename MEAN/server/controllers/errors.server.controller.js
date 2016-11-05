exports.handleError = function(res, err) {
  res.status(500).json(err);
};
