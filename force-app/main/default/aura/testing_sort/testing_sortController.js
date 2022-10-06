({
	doInit : function(component, event, helper) {
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
        /*component.set('v.mycolumns', [
            {label: 'Fields Name', fieldName: '', type: 'text'}
        ]);*/
        var pickselected = component.find("selectid").get("v.value");
        console.log('pickselected--->' + pickselected);
		component.set('v.selectedValue', pickselected);
        var selected = component.get('v.selectedValue');
        console.log('Selected--->' + selected);
        var action = component.get("c.objectFields");
        action.setParams({selectedObject : selected});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {           
                var allValues = response.getReturnValue();
            	console.log('allValues--->' + allValues);
                component.set("v.mydata", allValues);
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
    }
})