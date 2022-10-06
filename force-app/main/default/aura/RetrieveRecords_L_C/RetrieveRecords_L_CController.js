/* Description : This calls the apex controller and binds the Lightning component 
 * 				  with the results returned from the Apex Controller. 
 * Created by  : Harsha M R
   Created Date: 24 jul 2019
 * 
 */
({
	retrieve : function(component, event, helper) {
        var action = component.get("c.getContact");
        action.setCallback(this, function(har) {
        component.set("v.Contact", har.getReturnValue());
        });
        $A.enqueueAction(action);
   	}
})