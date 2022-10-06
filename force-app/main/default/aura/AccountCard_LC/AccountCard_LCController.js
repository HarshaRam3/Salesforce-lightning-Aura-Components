({
    doInit : function(component, event, helper) {
        var action = component.get("c.getacc");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS"){
                console.log(response.getReturnValue());
                component.set("v.acc",response.getReturnValue());
            }
            else{
                alert("ERROR");
            }
        });
        $A.enqueueAction(action);
    },
    contact : function(component, event, helper){
        var toasttitle = '';
        var type = '';
        var message = '';
        var action = component.get("c.createContact");
        var FirstName = component.get("{!v.FirstName}");
        var LastName = component.get("{!v.LastName}");
        var email = component.get("{!v.Email}");
        var phone = component.get("{!v.Phone}");
        var title = component.get("{!v.Title}");
        var accid = component.get("{!v.acc.Id}");
        console.log(FirstName);
        console.log(LastName);
        console.log(email);
        console.log(phone);
        console.log(title);
        console.log(accid);
        action.setParams({"CFirstName":FirstName, "CLastname":LastName, "Cemail":email, "CPhone":phone, "Ctitle":title, "Cacid":accid});
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                console.log(response.getReturnValue());
               // alert("Created");
                toasttitle = 'Success';
                type = 'success';
                message = 'Record is Created Successfully';
                component.set("v.isOpen", false);
            }
            else{
                toasttitle = 'Error';
                type = 'error';
                message = 'Error in calling server side action';
                //alert("Failed");
            }
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": toasttitle,
                "type": type,
                "message": message
            });
            toastEvent.fire();
            
        });
        $A.enqueueAction(action);
    },
    
    openModel: function(component, event, helper) {
        // for Display Model,set the "isOpen" attribute to "true"
        component.set("v.isOpen", true);
    },
    
    closeModel: function(component, event, helper) {
        // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
        component.set("v.isOpen", false);
    }
    
})