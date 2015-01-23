var mongoose = require('mongoose'),
	Schema = mongoose.Schema;

var ItemSchema = new Schema({
  product: {
    type: Schema.Types.ObjectId,
    ref: 'Product'
  },
  quantity: {
    type: Number
  }
});

var OrderSchema = new Schema({
	customer: {
		type: Schema.Types.ObjectId,
		ref: 'User'
	},
  products: [ItemSchema],
	created: {
    type: Date,
    default: Date.now
  }
});

OrderSchema.set('toJSON', {
  getters: true,
  virtuals: true
});

mongoose.model('Order', OrderSchema);
