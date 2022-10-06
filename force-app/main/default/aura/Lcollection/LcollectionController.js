/** Client-side Controller **/
({
  getNumbers: function(component, event, helper) {
    var numbers = [];
    for (var i = 0; i < 200; i++) {
      numbers.push({
        value: i
      });
    }
    component.set("v.numbers", numbers); 
    }
})