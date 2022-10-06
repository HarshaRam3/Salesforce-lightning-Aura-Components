({
	helperMethod : function(component,event,helper) {
		var action1 = component.get("c.getId");
        var oid = component.get("v.candidate.Position_Applied__c");
        console.log("setting parameter for action1");
        action1.setParams({
            "pname" : oid
        });
        console.log("setting parameter for action1 is done");
        action1.setCallback(this, function(response){
			var state = response.getState();
            if (state === "SUCCESS") {
                console.log("id from helper" + response.getReturnValue()); 
                component.set("v.candidate.Position_Applied__c",response.getReturnValue());
            }
            else {
                alert("error");
            }            
        });
        console.log("enque action1 in helper");
		$A.enqueueAction(action1);
	}
})