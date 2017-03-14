window.controllers = {}

let handler = function(){
  var $body = $("body");
  var controller = $body.data("controller").replace(/\//g, "_");
  var action = $body.data("action");

  var activeController = window.controllers[controller];

  if (activeController !== undefined) {
    if (window.env == "development") {
      console.log("[Controllers] " + controller + "." + action + "()");
    }

    if ($.isFunction(activeController.init)) {
      activeController.init();
    }

    if ($.isFunction(activeController[action])) {
      activeController[action]();
    }
  }
}

// $(handler);
document.addEventListener("turbolinks:load", handler)
