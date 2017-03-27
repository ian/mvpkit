// Courtesy of https://medium.com/@chrismnicola/leaving-sprockets-for-webpack-ccf7c6993ffa
function requireAll(r) { r.keys().forEach(r); }
function requireTree(path) { requireAll(require.context('./', true, /\.(js|coffee)$/)) }

window.$        = window.jQuery = require('jquery')
window._        = require('lodash')
window.is       = require('is')
window.Mustache = require('mustache/mustache')

require('mvpkit/assets/js/application')
require('bootstrap/dist/js/bootstrap')
require('selectize/dist/js/selectize')
require('mustache')

requireTree('lib')
requireTree('behaviors')
requireTree('controllers')

document.addEventListener("turbolinks:load", function(){
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
