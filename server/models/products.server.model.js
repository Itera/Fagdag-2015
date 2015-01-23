var mongoose = require('mongoose'),
	Schema = mongoose.Schema;

var ProductSchema = new Schema({
	name: {
		type: String,
		trim: true
	},
	brand: {
		type: String,
		trim: true
	},
	description: {
		type: String,
		trim: true
	},
	color: {
		type: String,
		trim: true
	},
	price: {
		type: Number
	}
});

ProductSchema.set('toJSON', {
    getters: true,
    virtuals: true
});

mongoose.model('Product', ProductSchema);
