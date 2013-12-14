// /**
//  * Module Dependencies
//  */
// var mongoose = require('mongoose');
// var Schema = mongoose.Schema;
// var ObjectId = Schema.ObjectId;

// var LiteratureSchema = new Schema({
//   user: {type: ObjectId, ref: 'User'},
//   category: {type: String, default: '', trim: true},
//   title: {type: String, default: '', index: true, trim: true},
//   authors: {type: String, default: ''},
//   year: {type: Number, default: 2013},
//   pages: {type: String, default: '', trim: true},
//   abstract: {type: String, default: '', trim: true},
//   tags: {type: String, default: '', index: true},
//   keywords: {type: String, default: '', index: true},
//   url: {type: String, default: '', trim: true},
//   publisher: {type: String, default: '', trim: true},
//   editors: [{type: String, default: '', trim: true}],
//   edition: {type: String, default: '', trim: true},
//   bookname: {type: String, default: '', trim: true},
//   isbn: {type: String, default: '', trim: true},
//   publication: {type: String, default: ''},
//   volumn: {type: Number, default: 0},
//   issue: {type: Number, default: 0},
//   city: {type: String, default: ''},
//   DOI: {type: String, default: ''},
//   college: {type: String, default: ''},
//   references: [{
//     title: {type: String, default: '', trim: true},
//     type: {type: String, default: ''}
//   }],
//   cited: [{type: String, default: ''}],
//   filepath: {type: String, default: ''},
//   accessories: [{type: String, default: ''}],
//   scoreavg: {type: Number, default: 0},
//   scorelist: [{
//     user: {type: ObjectId, ref: 'User'},
//     score: {type: Number, default: 0},
//     rateAt: {type: Date, default: Date.now}
//   }],
//   uploadAt: {type: Date, default: Date.now}
// });

// LiteratureSchema.statics = {
//   findById: function (id, cb) {
//     this.findById(id, '-scorelist', cb);
//   },

//   deleteById: function (id, cb) {
//     this.findByIdAndRemove(id, cb);
//   },

//   /**
//    * Search literature by keywords
//    * @param  regexp   words
//    */
//   searchByKeyWords: function (words, skip, cb) {
//     this.find({
//       title: words,
//       keywords: words
//     }, '_id title authors year abstract', {skip: skip})
//     .sort({scoreavg: -1, year: -1, title: 1})
//     .exec(cp);
//   }
// }


// mongoose.model('Literature', LiteratureSchema);


