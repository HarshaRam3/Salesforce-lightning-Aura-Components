({
	getData : function(component, event, helper) {
		
        var name = event.getParam('name');
        console.log(name.length);
        var age = event.getParam('age');
        var Designation = event.getParam('Designation');
        if(name.length !== 0){
        component.set('v.EmployeeNam',name);
        component.set('v.ag',age);
        component.set('v.Designatio',Designation);
        component.set('v.id',"true");
            }
        else{
            console.log("else");
            component.set('v.id',"false");
        }
    }
})