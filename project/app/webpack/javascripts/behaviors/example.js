// Behaviors are a way of specifying a behavior attribute on an HTML tag and having it always *work*
//
// For example, we'd specify:
//
// <div behavior="example">
//   ...
// </div>
//
// And we would automatically have the behavior setup ...

document.addEventListener("turbolinks:load", function(){
  _.each( $('*[behavior=example]'), function(obj){
    obj.controller = new Example(obj)
  })
})

class Example {
  constructor(obj, opts={}){
    // do something
  }
}
