({
    show : function(component, event, helper) {
        
        var columns=[
            {label:'Name',fieldName:'Name',type:'text', sortable : true},
            {label:'Industry',fieldName:'Industry',type:'text', sortable : true},
            {label:'Rating',fieldName:'Rating',type:'text', sortable : true},
            {label:'Phone',fieldName:'Phone',type:'text', sortable : true},
            {label:'Ownership',fieldName:'Ownership',type:'text', sortable : true}, ];
            
            component.set("v.columns",columns);
            helper.invoke(component,helper);
            },
            //Method gets called by onsort action,
            handleSort : function(component,event,helper){
            //Returns the field which has to be sorted
            var sortBy = event.getParam("fieldName");
            //alert(sortBy);
            //returns the direction of sorting like asc or desc
            var sortDirection = event.getParam("sortDirection");
            // alert(sortDirection);
            //Set the sortBy and SortDirection attributes
            component.set("v.sortBy",sortBy);
            component.set("v.sortDirection",sortDirection);
            // call sortData helper function
            helper.sortData(component,sortBy,sortDirection);
            },
            
            Addme : function(component, event, helper){     
            var selectedRows = event.getParam('selectedRows');  
            // alert(selectedRows);
            console.log(selectedRows);
            var raw = component.get("v.selection");  
            var action = component.get("c.getPileValue"); 
            //to calculate number of records
            component.set("v.selectedRowsCount", selectedRows.length);
            for (var i = 0; i < selectedRows.length; i++){
            action.setParams({SelectedValue : selectedRows[i].Name,
            PreviousValue:component.get("v.selection")});
}
 action.setCallback(this, function(response) {
    component.set("v.selection",selectedRows);
});
var action1 = component.get("c.selectedRowsRecord");
for (var i = 0; i < selectedRows.length; i++){
    action1.setParams({ entierRecord : selectedRows[i],
                       PreviousValue : "v.recordDetails" 
                      });
}
action1.setCallback(this, function(response) {
    component.set("v.recordDetails",response.getReturnValue());
});
$A.enqueueAction(action);
$A.enqueueAction(action1);
},   
    Onremove : function(component, event, helper){
        var clickedPillId = event.getSource().get("v.name");
        // alert(clickedPillId);
        var selected = component.find('dataTable').get("v.selectedRows");
        // alert(selectedRows);
        // console.log(selectedRows);
        var selectedRowList = component.get("v.selection");
        
        for(var index=0;index<selectedRowList.length;index++){
            
            if(clickedPillId == selectedRowList[index].Id){
                // alert('selectedRowList'+selectedRowList[index].Id);
                // alert('clickedPillId'+clickedPillId);
                selectedRowList.splice(index,1);
                selected.splice(index,1);
                component.set("v.selection",selectedRowList);
                component.find('dataTable').set("v.selectedRows",selected);
                component.set("v.selectedRowsCount", selectedRowList.length);
            }
        }
    },
        handleClick: function(component, event, helper){     		
            var selectedList = component.get('v.selection');
            var Str=new Array();
            for (var i= 0 ; i < selectedList.length ; i++){
                Str.push(selectedList[i]);
            }
            var idListJSON=JSON.stringify(Str);
            var action = component.get("c.createRecord");
            action.setParams({
                "PreviousValue":idListJSON
            });
            action.setCallback(this,function(response){
                var state = response.getState();
                console.log('state'+state);
                if (state === "SUCCESS") {
                    alert("Check Dummy_Account__C");
                }
                $A.enqueueAction(action);
            }
                              )},
                Search: function(component, event, helper) {
                    //var name1=component.find("v.accountname").get("v.value");
                    console.log('searchFunction');
                    var  name1=component.get("v.searchKeyword");
                    console.log('name1'+name1);
                    var action=component.get("c.fetchAccount");
                    //console.log('searchFunction');
                    action.setParams(
                        {"searchKeyWord":name1
                        });
                    action.setCallback(this,function(response){
                        var state = response.getState();
                        console.log('state'+state);
                        if (state === "SUCCESS") {
                            component.set("v.data", response.getReturnValue());
                        }
                    });
                    $A.enqueueAction(action);
                }

})