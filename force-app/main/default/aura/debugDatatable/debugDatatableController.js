({
    init : function(component, event, helper) {
        var action = component.get("c.objectNames");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var allValues = response.getReturnValue();
                component.set("v.pickl", allValues);
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
        $A.enqueueAction(action);
    },
    
    doSearch : function(component, event, helper) {
        helper.helperMethod(component,event);
    },
    
    handleChange: function (component, event) {
        var selectedOptionsList = event.getParam("value");
        var params = event.getParams();
        for (var f in params) {
            console.log(f + ' = ' + params[f])
        }
        console.log('selectedOptionsList'+selectedOptionsList);
        component.set("v.selectedSkillsItems" , selectedOptionsList);
    },
    
    getSelectedGenre : function(component, event, helper){
        //Get selected Genre List on button click
        var selectedValues = component.get("v.selectedSkillsItems");
        console.log('Selectd Genre-' + JSON.stringify(selectedValues));
        var opts = [];
        for (var i = 0; i < selectedValues.length; i++) {
            opts.push({
                label: selectedValues[i],
                fieldName: selectedValues[i],
                sortable:true
            });
        }
        console.log('columList++'+JSON.stringify(opts));
        component.set("v.columns", opts);
    },
     handleColumnSorting: function (component, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        component.set("v.sortedBy", fieldName);
        component.set("v.sortedDirection", sortDirection);
        //helper.sortData(component, fieldName, sortDirection);
        helper.helperMethod(component,event);
    },
    
});