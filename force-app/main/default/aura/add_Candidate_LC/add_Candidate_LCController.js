({	
    doInit : function(component, event, helper){
        var action = component.get("c.getPositions");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.openPositions",response.getReturnValue());  
            }
            else{
                alert("error");
            }
        });
        $A.enqueueAction(action);
    },
    saveMe : function(component, event, helper) {
        var action1 = component.get("c.getId");
        var cname = component.get("v.candidate.Name");
        var cphone = component.get("v.candidate.Phone__c");
        var cemail = component.get("v.candidate.Email__c");
        var cexperience = component.get("v.candidate.Experience__c");
        var cposi = component.get("v.candidate.Position_Applied__c");
        var cnotice = component.get("v.candidate.Notice_Period__c");
        action1.setParams({
            "pname" : cposi
        });
        action1.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var candipositionid = response.getReturnValue();
                var action = component.get("c.Create_Candidate");
                action.setParams({
                    "cname": cname,
                    "cemail":cemail,
                    "cphone":cphone,
                    "cexperience":cexperience,
                    "cposition":candipositionid,
                    "cnotice": cnotice
                });
                action.setCallback(this, function(response){
                    var state = response.getState();
                    if (state === "SUCCESS") {
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            "type" : "success",
                            "title": "Success!",
                            "message": "The record has been inserted successfully."
                        });
                        toastEvent.fire();
                        var myEvent = $A.get("e.c:notifyCandidateView");
                        myEvent.fire();
                    }
                    else {
                        alert("not done");
                    }
                });
              //  $A.get('e.force:refreshView').fire();
                $A.enqueueAction(action);
                
            }
            else {
                alert("error");
            }            
        });
        $A.enqueueAction(action1);
        component.set("v.candidate.Name","");
        component.set("v.candidate.Phone__c","");
        component.set("v.candidate.Email__c","");
        component.set("v.candidate.Position_Applied__c","");
        component.set("v.candidate.Experience__c","");
        component.set("v.candidate.Notice_Period__c","");
    },
    clearMe : function(component, event, helper) {
        component.set("v.candidate.Name","");
        component.set("v.candidate.Phone__c","");
        component.set("v.candidate.Email__c","");
        component.set("v.candidate.Position_Applied__c","");
        component.set("v.candidate.Experience__c","");
        component.set("v.candidate.Notice_Period__c","");
    }
})