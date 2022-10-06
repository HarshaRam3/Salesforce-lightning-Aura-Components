({
	invoke : function(component,helper) {
		var action=component.get("c.getData");
        action.setCallback(this,function(response){
            var state=response.getState();
            console.log('Status:'+status);
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                //alert(result);
                component.set("v.data",result);
               // console.log(result);
            }
        });
        $A.enqueueAction(action);
	},
    sortData : function(component,fieldName,sortDirection){
        var data = component.get(" v.data");
        //function to return the value stored in the field
        var key = function(a) { return a[fieldName]; }
        var reverse = sortDirection == 'asc' ? 1: -1;
        
        // to handel number/currency type fields 
        if(fieldName == 'Name'){ 
            data.sort(function(a,b){
                var a = key(a) ? key(a) : '';
                var b = key(b) ? key(b) : '';
                return reverse * ((a>b) - (b>a));
            }); 
        }
        else{// to handel text type fields 
            data.sort(function(a,b){ 
                var a = key(a) ? key(a).toLowerCase() : '';//To handle null values , uppercase records during sorting
                var b = key(b) ? key(b).toLowerCase() : '';
                return reverse * ((a>b) - (b>a));
            });    
        }
        //set sorted data to accountData attribute
        component.set(" v.data",data);
    },
    
    /*loadData : function(component){
        return new Promise($A.getCallback(function(resolve){
            var limit = component.get("v.initialRows");
            var offset = component.get("v.currentCount");
            var totalRows = component.get("v.totalRows");
            if(limit + offset > totalRows){
                limit = totalRows - offset;
            }
            var action = component.get("c.loadAccountRecords");
            action.setParams({
                "rowLimit" :  limit,
                "rowOffset" : offset
            });
            action.setCallback(this,function(response){
                var state = response.getState();
                var newData = response.getReturnValue();
                // play a for each loop on list of new accounts and set Account URL in custom 'accountName' field
                newData.forEach(function(account){
                    account.accountName = '/'+account.Id;
                });
                resolve(newData);
                var currentCount = component.get("v.currentCount");
                currentCount += component.get("v.initialRows");
                // set the current count with number of records loaded 
                component.set("v.data",currentCount);
            });
            $A.enqueueAction(action);
        }));
    }
*/
  
})