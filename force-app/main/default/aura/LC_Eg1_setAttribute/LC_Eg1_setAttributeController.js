({
    callme : function(component, event, helper) {
        component.set("v.myname","Harsha M R");
        component.set("v.age",26);
        component.set("v.salary",100000);
        
    },
    
    clear : function(component, event, helper) {
        component.set("v.myname","");
        component.set("v.age","");
        component.set("v.salary","");
    }
})