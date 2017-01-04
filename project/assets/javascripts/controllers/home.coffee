class Controller
  index: ()=>
    # Registration page logic
    $('#new_conversion').on('submit', (e)->
      window.track("Conversion Submit", { source: "Registration Form" })
    )

    $('#new_conversion').on('ajax:success', ()->
      top.location = "/conversion"
    )

  thanks: ()=>
    # Conversion page logic

window.controllers['home'] = new Controller()
