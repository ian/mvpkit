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

  ClientSideValidations.callbacks.form.fail = function(form, eventData){
    $("form.disable-on-submit .btn").removeClass('disabled')
  }
})
