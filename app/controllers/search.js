//Literature.plugin(textSearch);

exports.index = function (req, res) {
  res.render("search/index", {});
}

exports.showSearchResults = function (req, res) {
  res.render('search/results', {
    title: 'Search Results'
  })
}