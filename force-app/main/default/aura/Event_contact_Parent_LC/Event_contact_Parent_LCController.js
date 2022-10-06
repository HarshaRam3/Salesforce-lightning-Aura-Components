({
	show : function(component, event, helper) {
        console.log("test");
		var name = event.getParams("con.Name");
        console.log(name);
        component.set("v.cname",name);
	}
})