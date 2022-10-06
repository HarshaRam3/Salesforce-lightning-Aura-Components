({
	callme : function(component, event, helper) 
    {
		var evt = component.getEvent("firstEvent");
        evt.fire();
	}
})