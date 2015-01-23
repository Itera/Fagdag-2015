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

ItemSchema.set('toJSON', {
    getters: true,
    virtuals: true
});

mongoose.model('Item', ItemSchema);