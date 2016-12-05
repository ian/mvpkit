require('jquery')
require('jquery-ujs')
require('jquery.cookie')
// var _  = require('lodash')
var is = require('is')

require('./init/controllers')
require('./init/forms')

track = function(event, attributes, fn){
  console.log("Track: " + event + " " + JSON.stringify(attributes))

  if (is.fn(attributes)) fn = attributes, attributes = null;
  if (is.undefined(attributes)) { attributes = {} }
  if ($.cookie('invisible') == "true") {
    if (!is.undefined(fn)) { fn() }
    return
  }

  if (typeof(analytics) == 'undefined') {
    return
  }

  attrs = _.extend({
    iteration: $('body').data('iteration')
  }, attributes)

  analytics.track(event, attrs, fn)
}

setupAutomaticTracing = function(){
  _.each(arguments, function(e){
    switch (e.toLowerCase()) {
      case 'buttons':
        $('.btn').on('click', function(){
          window.track("Button Clicked", { name: $(this).text() || $(this).attr('value') })
        })
        break;
      case 'links':
        $('a:not(.btn)').on('click', function(){
          window.track("Link Clicked", { name: ($(this).text() || $(this).attr('value')) })
        })
        break;
    }
  })
}

window.track = track;
