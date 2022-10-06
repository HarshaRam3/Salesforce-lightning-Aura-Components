({
	doInit : function(component, event, helper) {
		var columns = [
            {label:'Account Name', fieldName: 'Name', type:'String'},
            {label:'Account Id', fieldName:'Id', type:'id'}]
		component.set('v.mycoloumn',columns);
        var action = component.get("c.getAcc");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.myAccounts",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})