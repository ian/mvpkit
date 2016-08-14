class Controller
  index: ()=>
    # Registration page logic

    $('.modal').on('shown.bs.modal', ()=>
      $('#new_user').resetClientSideValidations()
    )

    $('#new_conversion').on('submit', (e)->
      e.preventDefault()

      $(this).find(".btn").addClass('disabled')
      window.track("Conversion Submit", { source: "Email" })
    )

    $('#new_conversion').on('ajax:success', ()->
      setTimeout(()->
        top.location = "/conversion"
      , 1000)
    )

    ClientSideValidations.callbacks.form.fail = (form, eventData)=>
      $("#new_conversion .btn").removeClass('disabled')

  thanks: ()=>
    # Conversion page logic

window.controllers['home'] = new Controller()
