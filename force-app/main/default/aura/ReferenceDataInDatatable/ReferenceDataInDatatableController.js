({
    doInit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Opportunity Name', fieldName: 'Name', type: 'text'},
            {label: 'Account Name', fieldName: 'AccountName', type: 'text'},
            {label: 'Account Owner', fieldName: 'AccountOwner', type: 'text'},
            {label: 'Opportunity Owner', fieldName: 'OpportunityOwner', type:'text'},
            {label: 'CreatedDate', fieldName: 'CreatedDate', type:'Date'}
        ]); 
        
        // getting Opportunity data from server
        var action = component.get("c.retriveOpportunities");
        action.setParams({
            // set parameters if any 
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var rows = response.getReturnValue();
                
                for (var i = 0; i < rows.length; i++) {
                    var row = rows[i];
                    // checking if any account related data in row
                    if (row.Account) {
                        row.AccountName = row.Account.Name;
                        row.AccountOwner = row.Account.Owner.Name;
                    }
                    // checking if any owner related data in row
                    if(row.Owner) {
                        row.OpportunityOwner = row.Owner.Name;
                    } 
                    // formatting created date 
                    row.CreatedDate = $A.localizationService.formatDate(row.CreatedDate, "MMMM DD YYYY, hh:mm:ss a")
                }
                // setting formatted data to the datatable
                component.set("v.data", rows);
            }
        });
        $A.enqueueAction(action);
    }
})