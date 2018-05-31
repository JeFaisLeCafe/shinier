var question = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/questions/autocomplete?query=%QUERY',
    wildcard: '%QUERY'
  }
});

window.$('#question_search').typeahead(null, {
  source: question,
  display: function(e) {
    return $(e).text();
  },
  templates: {
    suggestion: function(data) {
      return data;
    }
  }
});
