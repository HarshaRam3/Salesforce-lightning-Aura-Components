// actionParamTypesController.js
({

    putstringc : function(component, event, helper) {
        helper.putdatatype(component, "c.pstring", "hello!");
    }, 
    putobjectc : function(component, event, helper) {
        helper.putdatatype(component, "c.pobject", true);
    },
    putblobc : function(component, event, helper) {
        helper.putdatatype(component, "c.pblob", "some blob as string");
    },

    putlistoflistoflistofstringc : function(component, event, helper) {
        helper.putdatatype(component, "c.plistoflistoflistofstring", [[['a','b'],['c','d']],[['e','f']]]);
    },
});