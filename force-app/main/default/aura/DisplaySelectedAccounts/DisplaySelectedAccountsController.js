({
    doInit : function(component, event, helper) {
        var col = [
            {label:'Account Name', fieldName:'Name', type:'text'},
            {label:'Phone', fieldName:'Phone', type:'phone'}
        ]
        component.set("v.columns",col);
    },
    Show : function(component, event, helper){
    alerrt("click");
    
	}
 })