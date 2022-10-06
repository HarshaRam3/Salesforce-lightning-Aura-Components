({
	send : function(component, event, helper) {
        var name = component.get("v.cname");
		var evt = component.getEvent("first");
        evt.setParams({"con.Name":name});
        evt.fire();
        alert('fired');
	}
})