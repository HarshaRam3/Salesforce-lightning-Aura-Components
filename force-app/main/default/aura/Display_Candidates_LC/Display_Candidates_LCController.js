({
	doInit : function(component, event, helper) {
        component.set("v.columns",[
            {label: 'Candidate Name', fieldName : 'Name', type:'text'},
            {label: 'Phone', fieldName : 'Phone__c', type:'phone'},
            {label: 'Email', fieldName : 'Email__c', type:'email'},
            {label: 'Position Applied', fieldName : 'Position_Applied__c', type:'text'},
            {label: 'Experience', fieldName : 'Experience__c', type:'number'},
            {label: 'Notice Period', fieldName : 'Notice_Period__c', type:'text'}
        ]);
        
        var action = component.get("c.getCandidatesHere");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                console.log(response.getReturnValue());
                component.set("v.candidates",response.getReturnValue());
                
            }
            else{
                alert("Error in retrieving candidate data");
            }
        })
        $A.enqueueAction(action);
	},

    refresh : function(component, event, helper){
        $A.get('e.force:refreshView').fire();

    }
})