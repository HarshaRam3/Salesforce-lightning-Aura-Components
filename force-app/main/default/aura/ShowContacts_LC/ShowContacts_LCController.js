({
    doInit : function(component, event, helper) {
        var myColumns = [
            {label:"Contact Name", fieldName:"Name", type:"Text"},
            {label:"Account Name", fieldName:"Account", type:"Text"}
        ]
        component.set('v.myColumns',myColumns);
        var action = component.get("c.getCon");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state==='SUCCESS'){
                component.set("v.myContacts",response.getReturnValue());
            }
            else{
                console.log(response.getError());
            }
        });
        $A.enqueueAction(action);
    }
    
})