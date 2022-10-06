({
doSave : function(component, event, helper) {
        // Assign Attribute value to JS Var
        var newjob = component.get("v.Accounts");
        // Storing new controller Value
        var action = component.get("c.NewAccount");
        // Set attribute value into Server Controller method
        action.setParams({
       // assinging the Controller Parameter to attribute js variable
            "Accounts" : newjob 

        }); 
       // Return value
        action.setCallback(this, function(response){
       // get state of thetransaction
         var state = response.getState();
         if(state === "Success"){
           var Accounts = response.getReturnValue();
             Accounts.setParams({
                    "title": "Success!",
          "message" : "Account record has been inserted successfully."
                });
         // "message" : "Account record has been inserted successfully."

         }
        },'ALL');
        $A.enqueueAction(action);
               alert("hello there!"); 

}
})