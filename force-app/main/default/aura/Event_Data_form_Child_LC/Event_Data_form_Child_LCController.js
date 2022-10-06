({
	callme : function(component, event, helper) {
		var evt = component.getEvent("myEvent");
        evt.setParams({"name":component.get("v.EmployeeName"),"age":component.get("v.age"),"Designation":component.get("v.Designation")});
		evt.fire();
    },
    callmecancel : function(component,event,helper){
        var evt = component.getEvent("myEvent");
        evt.setParams({"name":"","age":"","Designation":""});
		evt.fire();
        component.set("v.EmployeeName","");
        component.set("v.age","");
        component.set("v.Designation","");
    }
})