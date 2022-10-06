({
	clear : function(component, event, helper) {
		component.set("v.amount","");
        component.set("v.roi","");
        component.set("v.term","");
        component.set("v.si","");
        component.set("v.ci","");
	},
    siminterest : function(component, event, helper) {
        var p = component.get("{!v.amount}");
        var t = component.get("{!v.roi}");
        var r = component.get("{!v.term}");
        var si = parseInt(p*t*r/100);
        console.log(si);
        component.set("v.si",si);
    },
    compinterest : function(component, event, helper) {
		var p = component.get("{!v.amount}");
        var t = component.get("{!v.roi}");
        var r = component.get("{!v.term}");
        var a = p*Math.pow((1 +r/100),t );
        var ci = a - p;
        console.log(ci);
        component.set("v.ci",ci);
	}
})