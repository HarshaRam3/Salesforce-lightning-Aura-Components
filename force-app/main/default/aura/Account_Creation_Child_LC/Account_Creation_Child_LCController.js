({
	saveMe : function(component, event, helper) {
        var accnew = component.get("v.newAcc");
        console.log("Account details",accnew.Name);
		var evt = component.getEvent("myEvent");
        evt.setParams({"acc":accnew});
        evt.fire();
        component.set("v.newAcc.Name","");
        component.set("v.newAcc.Phone","");
	},
    
    clear : function(component, event, helper){
        component.set("v.newAcc.Name","");
        component.set("v.newAcc.Phone","");
    }
})