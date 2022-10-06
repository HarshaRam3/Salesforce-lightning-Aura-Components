/* Description : Generic_Compo controller to set the value to the controller and getting back the query results
 * 
 */
({
    doInit : function(component, event, helper) {
        var action = component.get("c.getsendObjectDetails");
        action.setParams({ objName : component.get("v.objName")
                          });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("{!v.sObjects}", response.getReturnValue());
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                    errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        
        
        $A.enqueueAction(action);
    },
})