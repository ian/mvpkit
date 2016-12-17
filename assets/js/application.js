require('jquery')
require('jquery-ujs')
require('jquery.cookie')
// var _  = require('lodash')
var is = require('is')

require('./init/controllers')
require('./init/forms')

window.track = function(event, attributes, fn){
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
