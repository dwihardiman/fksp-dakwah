app.Episodes = function() {
  this._input = $('#episodes-search-txt');
  this._initAutocomplete();
};

app.Episodes.prototype = {
  _initAutocomplete: function() {
    this._input
      .autocomplete({
        source: '/welcome',
        appendTo: '#episodes-search-results',
        select: $.proxy(this._select, this)
      })
      .autocomplete('instance')._renderItem = $.proxy(this._render, this);
  },

  _render: function(ul, item) {
    var markup = [
      '<span class="img">',
      '<img src="' + item.episode_thumbnail + '" />',
      '</span>',
      '<span class="title">' + item.title + '</span>',
      '<span class="price">' + item.description + ' ' + item.published_at + '</span>'
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },

  _select: function(e, ui) {
    this._input.val(ui.item.title);
    return false;
  }
};
