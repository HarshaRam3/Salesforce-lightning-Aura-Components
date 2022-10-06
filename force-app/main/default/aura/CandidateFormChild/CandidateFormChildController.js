({
    onLoad :function(component,evnt,helper){
        var action = component.get("c.getOpenPositionsAsString")
        action.setCallback(this, function(response){
        var state = response.getState();
	//	console.log("state",state);
        if(state === "SUCCESS"){
            component.set("v.openpositions",response.getReturnValue());
            console.log("open Positions:",response.getReturnValue());
        }      
        else{
            alert("ERROR");
        }
        });
        $A.enqueueAction(action);
    },
    
    callme : function(component, event, helper) {
       // console.log("position",component.find("select").get("v.value"));
       // console.log("after helper");
       // console.log("name",component.get("v.candidate.Open_Position__c"));
        var candidat = component.get("v.candidate");
        var evt = component.getEvent("sndData");
        evt.setParams({"candi":candidat});
        evt.fire();
        component.set("v.candidate.Name","");
        component.set("v.candidate.Phone__c","");
        component.set("v.candidate.Email__c","");
        component.set("v.candidate.Experience__c","");
        component.set("v.candidate.Notice_Period__c","");
        var action = component.get("c:createCandidat");
        action.setParams({"can":component.get("v.candidate")});
        console.log("hhhhhhhhh");
        action.setCallBack(this,function(response){
            var state = response.getState();
           /* if(state === 'SUCCESS'){
                console.log(reponse.getReturnValue());
            }
            else{
                console.log(response.message());
            }*/
            console.log(reponse.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    clear : function(component,event,helper) {
        component.set("v.candidate","");
    }
})