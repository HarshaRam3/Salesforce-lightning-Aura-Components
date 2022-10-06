({
    fetchData : function(cmp) {
        var action = cmp.get("c.getContact");
        
        action.setCallback(this,function(resp){
            var state = resp.getState();
            
            if(state === 'SUCCESS'){
                var records = resp.getReturnValue();
                //console.log(JSON.stringify(records));
                //pass the records to be displayed
                cmp.set("v.returnList",records);
            }
        });
        $A.enqueueAction(action);   
    }
})