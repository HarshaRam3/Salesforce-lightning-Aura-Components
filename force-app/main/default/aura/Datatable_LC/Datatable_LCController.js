({
	doInit : function(component, event, helper) {
        var columns = [
            {label:'Account Name', fieldName:'Name',type:'text',editable:'true'},
            {label:'Account Industry', fieldName:'Industry', Type:'Text'}]
        component.set('v.myColumns',columns);
		var action = component.get("c.getAcc");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.acctList",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})