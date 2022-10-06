({
    /** Client-side Controller **/
    doInit : function(component, event, helper) {
        helper.getThisReconciliation(component, helper);
        var cols = [
            {label: 'Vendor', fieldName: 'a02_Vendor__r.Name', type: 'text'},
            {label: 'Type', fieldName: 'RecordType.Name', type: 'text'},
            {label: 'Created', fieldName: 'CreatedDate', type: 'Date'}
        ];
        component.set("v.tableCols", cols);
    },
})
HELPERS
({
    // Function will get the Data for the current Reconciliation
    // object and set the corresponding aura attribute.
    getThisReconciliation : function(component, helper) {
        var action = component.get("c.getThisReconciliation");
        action.setParams({"recId":component.get("v.recordId")})
        action.setCallback(this, $A.getCallback(function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.thisRecon", response.getReturnValue());
            }
            else {
                helper.counselLogErrors(response.getError());
            }
        }));
        $A.enqueueAction(action);
    },
    
    // Function will get the data for the related accounts benefit
    // detail data and set it to the corresponding aura attribute.
    getBenefitDetails : function(component, helper) {
    	var action = component.get("c.getBenefitDetails");
        var reconciliation = component.get("v.thisRecon");
        action.setParams({"accId":reconciliation.Account__c})
        action.setCallback(this, $A.getCallback(function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());  // <-- Works as expected...
                component.set("v.benefits", response.getReturnValue());
            }
            else {
                helper.counselLogErrors(response.getError());
            }
        }));
        $A.enqueueAction(action);
	},
    
    // Funciton logs any errors to the js browser console.
   	counselLogErrors : function(errors) {
        if (errors) {
            if (errors[0] && errors[0].message) {
                console.log("Error message: " + errors[0].message);
            }
        } else {
            console.log("Unknown error");
        }
	},
})
RENDERS
({
    afterRender: function (component, helper) {
        this.superAfterRender();
        helper.getBenefitDetails(component, helper);
    },
})