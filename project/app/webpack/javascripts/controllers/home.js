class Controller {
  init() {
    const self = this

    $('#new_conversion').on('submit', function(e){
      window.track("Conversion Submit", { source: "Registration Form" })
    })

    $('#new_conversion').on('ajax:success', function(){
      top.location = "/conversion"
    })
  }
}

window.controllers['home'] = new Controller()
