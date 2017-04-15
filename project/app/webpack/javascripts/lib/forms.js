const _  = require('lodash')
const is = require('is')

$(function(){
  $('form.no-enter-submit').bind("keypress", function(e) {
    if (e.keyCode == 13) {
      e.preventDefault();
      return false;
    }
  });

  $('form.disable-on-submit').on('submit', function(e){
    $(this).find(".btn").addClass('disabled')
  })
})

// Submit forms when you command + enter on a textarea
// $(function(){
// 	// submit form on command + enter if in a textarea
// 	$(document).on('keydown', 'body', function(e) {
// 		if (!(e.keyCode == 13 && e.metaKey)) return;
//
// 		var $target = $(e.target);
// 		if ($target.is('textarea')) {
// 			$target.closest('form').submit();
// 		}
// 	});
// });
