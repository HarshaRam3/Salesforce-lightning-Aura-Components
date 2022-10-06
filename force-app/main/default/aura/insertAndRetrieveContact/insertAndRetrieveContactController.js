({
	doSave : function(component, event, helper) {
        var action = component.get('c.createContact');
        action.setParams({
            cont : component.get('v.CreateContact'),
            AccountId : component.get('v.accountId')
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            alert(state);
            if(state === 'SUCCESS' || state === 'DRAFT'){
                var responseValue = response.getReturnValue();
            }else if(state === 'ERROR'){
                
            }
                else if(state === 'ERROR')  {
                    
                }
        },'ALL');
        $A.enqueueAction(action);
	}
})