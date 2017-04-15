// https://webpack.github.io/docs/context.html#require-context
function requireAll(requireContext) {
  return requireContext.keys().map(requireContext);
}

window.$        = window.jQuery = require('jquery')
window._        = require('lodash')
window.is       = require('is')
window.Mustache = require('mustache/mustache')

require('jquery')
require('jquery-ujs')
require('js-cookie')
require('bootstrap/dist/js/bootstrap')
require('selectize/dist/js/selectize')
require('mustache')

requireAll(require.context("./lib", true, /\.js$/));
requireAll(require.context("./behaviors", true, /\.js$/));
requireAll(require.context("./controllers", true, /\.js$/));

$(function(){
  // $('*[data-toggle="popover"]').popover()
  // $('select').selectize()
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()

  // Redirect to hash after page is loaded since the conversation is injected
  if (!is.empty(window.location.hash.substring(1)) ) {
    location.href = "#" + window.location.hash.substring(1);
  }

  setTimeout(function(){
    $('.fadeout.alert').fadeOut('slow')
  }, 2000);

  $(document).on('turbolinks:click', function (event) {
    if (event.target.getAttribute('href').charAt(0) === '#') {
      return event.preventDefault()
    }
  })
})

jQuery.fn.extend({
  disable: function(state) {
    return this.each(function() {
        this.disabled = state;
    });
  }
})
