({
	
    fetchAccounts : function(component, event, helper) {
        component.set('v.mycolumns1', [
             {label: 'Id', fieldName: 'Id', type: 'Id'},
             {label: 'Name', fieldName: 'Name', type: 'Text'},
                {label: 'Created By', fieldName: 'CreatedById', type: 'text'},
                {label: 'Last Modified By', fieldName: 'LastModifiedById', type: 'text'}
               //, {label: 'Type', fieldName: 'Type', type: 'Text'}
            ]);
        console.log("hello1")
        var action = component.get("c.fetchAccts");
        action.setParams({ objectname : component.get("v.selectedValue"),
                          fieldname : component.get("v.Fields")
        });
        console.log("hey");
        console.log("fieldname");

        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                component.set("v.acctList", response.getReturnValue());
                
            }
        });
        $A.enqueueAction(action);
    }
})