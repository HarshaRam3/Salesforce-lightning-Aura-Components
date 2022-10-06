({	
    doInit : function(component, event, helper){
        var col = [
            {label:'Account Name', fieldName:'Name', type:'text'},
            {label:'Account Phone', fieldName:'Phone', type:'Integer'}
             ];
        component.set("v.acolumns",col);
    },
    
	showme : function(component, event, helper) {
		var accDetails = event.getParam("acc");
        var accounts = component.get("v.accList");
        accounts.push(accDetails);
        component.set("v.accList",accounts);
	}
})