var mongoose = require('mongoose'),
	Schema = mongoose.Schema;

var OrderSchema = new Schema({
	customer: {
		type: Schema.Types.ObjectId,
		ref: 'User'
	},
	products: {
		type: [Schema.Types.ObjectId],
		ref: 'Item'
	},
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