({
    doInit : function(component,event,helper) {
        console.log("doinit");
        //Column data for the table
        var columns = [
            {
                label:'Customer Name',
                fieldName:'Name',
                type:'text'
            },
            {
                label:'Phone#',
                fieldName:'Phone',
                type:'text'
            }
        ];
        //pass the column information
        component.set("v.returnColumns",columns);
        
        //recriving data from server
        helper.fetchData(component);
    },
    createDT : function(component, event, helper) {
        //Creating dynamic Lightning datatable
        
        var targetCmp=component.find("newDtPlaceholder");
        targetCmp.set("v.body",[]); //destroying existing one
        
        $A.createComponent(
            "lightning:datatable",
            {
                "data":component.get("v.returnList"),
                "columns":component.get("v.returnColumns"),
                "keyField":"Id",
                "maxRowSelection":"1",
                "onrowselection":component.getReference("c.getSelectedRecord") //adding this line is causing the issue. But I need to hookup onrowselection event
            },
            function(tbl,state,message)
            {
                console.log(state +" - " +message);
                var body=targetCmp.get("v.body");
                body.push(tbl);
                targetCmp.set("v.body",body);
            }
        );
    },
    getSelectedRecord: function(component, event, helper){ 
        var selectedRows = event.getParam('selectedRows');
        console.log(JSON.stringify(selectedRows[0]));
    }
})