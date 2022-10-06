({
	init2winit : function(component, event, helper) {
    var action = component.get('c.getObjectFields');
    action.setParams({
        objName: 'Contact'
    });

    action.setCallback(this, function(response){
        var options = [];
        var fieldMap = response.getReturnValue(); 
        for (var k in fieldMap) {
            options.push({ value:k, label:fieldMap[k]});
        }
        component.set('v.options', options);
    });
    $A.enqueueAction(action); 
}
})