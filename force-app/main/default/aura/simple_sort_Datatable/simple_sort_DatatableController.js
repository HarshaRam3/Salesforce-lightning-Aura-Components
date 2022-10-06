({
    fetchAccounts : function(component, event, helper) {
        component.set('v.mycolumns', [ 
                {label: 'Id', fieldName: 'Id', type: 'Id'},
                 {label: 'Name', fieldName: 'Name', type: 'Text'},
                    {label: 'Created By', fieldName: 'CreatedById', type: 'text'},
                    {label: 'Last Modified By', fieldName: 'LastModifiedById', type: 'text'}
                   //, {label: 'Type', fieldName: 'Type', type: 'Text'}
        ]);
        var action = component.get("c.fetchAccts");
        action.setParams({
            objectname : component.get("v.object"),
                          fieldname : component.get("v.Fields")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.acctList", response.getReturnValue());
                        console.log(response.getReturnValue());

                helper.sortData(component, component.get("v.sortedBy"), component.get("v.sortedDirection"));
            }
        });
        $A.enqueueAction(action);
    },
    updateColumnSorting: function (cmp, event, helper) {
        var fieldName = event.getParam('fieldName');
        console.log(fieldName);
        var sortDirection = event.getParam('sortDirection');
                console.log(sortDirection);

        cmp.set("v.sortedBy", fieldName);
        cmp.set("v.sortedDirection", sortDirection);
        helper.sortData(cmp, fieldName, sortDirection);
    }
})