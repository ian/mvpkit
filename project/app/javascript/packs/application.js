/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Support component names relative to this directory:
var componentRequireContext = require.context("components", true)
var ReactRailsUJS = require("react_ujs")
ReactRailsUJS.useContext(componentRequireContext)

window.Tether             = require('tether');
window.Popper             = require('popper.js').default
window.jQuery             = require('jquery')
window.jQueryUJS          = require('jquery-ujs');
window.$                  = window.jQuery;

window.is                 = require('is_js');
window._                  = require('lodash');
_.mixin(require('lodash-inflection'));

window.Moment             = require('moment');
window.bs                 = require('bootstrap');

window.ReactstrapExamples = require('components/examples/reactstrap');
window.Conversion         = require('components/conversion');
