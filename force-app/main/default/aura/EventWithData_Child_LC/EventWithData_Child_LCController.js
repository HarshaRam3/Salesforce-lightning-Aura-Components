({
	call : function(component, event, helper) 
    {
        var nmmm = component.get("v.nam");
		var evt = component.getEvent("Second");
        evt.setParams({"empname":nmmm});
        evt.fire();
	}
})