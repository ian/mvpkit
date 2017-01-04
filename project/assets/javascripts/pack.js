const is      = require('is')

global.Tether = require('tether')
global.$      = global.jQuery = require('jquery')

require('minimum_viable_product/assets/js/application')
require('bootstrap/dist/js/bootstrap')

require('./controllers/home.coffee')
