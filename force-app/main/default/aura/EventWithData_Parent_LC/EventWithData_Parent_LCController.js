({
	showme : function(component, event, helper) 
    {
        console.log("hello");
		var name = event.getParam('empname');
        component.set('v.Employee',name);
        //alert('data entered in child component'+name);
	}
})