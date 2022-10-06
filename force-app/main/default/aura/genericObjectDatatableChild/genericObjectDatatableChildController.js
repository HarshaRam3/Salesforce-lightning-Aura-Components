({
	doInit : function(component, event, helper) {
		var sobject = component.get('v.objName');
        var fieldName = component.get('v.fieldName');
        var formatText = component.find("fielddata");
        if(!fieldName.includes('.')) {
        	formatText.set("v.value",sobject[fieldName]);
        }
        else {
            console.log(sobject[fieldName.split(".")[0]]);
            formatText.set("v.value",sobject[fieldName.split(".")[0]][fieldName.split(".")[1]]); //Here we are fetching data from parent field
        }
	}
    
})