({
	doInit : function(component, event, helper) {
        var action = component.get("c.objectNames");
        console.log(action);
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {           
                var allValues = response.getReturnValue();
                component.set("v.pickl", allValues);
                console.log(allValues);
            }        	         
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } 
                else {
                    console.log("Unknown Error");
                }
            }
        });
        
        
      	},
  doSearch : function(component, event, helper) {
      	        helper.fetchAccounts(component, event, helper);
            $A.enqueueAction(action);
        }
})