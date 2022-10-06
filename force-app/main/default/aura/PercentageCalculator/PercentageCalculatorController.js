({
	doClick : function(component, event, helper) {
       /* alert(component.isValid());
        alert(component.getName());
        alert(component.get('v.Whom'));/*/
        component.set('v.Whom','Harsha M R');
        //var ageCom = component.find('testInput');
        //alert(ageCom.get('v.value'));
        var ageComp = component.find('testInput');
        alert(ageComp.get('v.value'));
        ageComp.set('v.value',67);
        //set name take 2 parameters
        //key - Attribute
        //Value - That we wanted to be set
	},

})