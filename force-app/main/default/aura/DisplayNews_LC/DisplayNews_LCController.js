({

    doInit : function(component, event, helper){
        var columns = [
            {label:'Author', fieldName:'author',type:'text'},
            {label:'Title', fieldName:'title',type:'text'},
            {label:'Description', fieldName:'description',type:'text'},
            {label:'URL', fieldName:'url',type:'text'}
            //{label:'Title', fieldName:'title',type:'text'}
            
        ];
        component.set("v.columns",columns);
        //alert('inside action');
		var action = component.get("c.getNews");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var res = response.getReturnValue();
                console.log(res);
                component.set("v.News",res);
            }
            else{
                console.log(response.getMessage());
            }
        })
        $A.enqueueAction(action);
    }
    /*,
	showNews : function(component, event, helper) {
        alert('inside action');
		var action = component.get("c.getNews");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var res = response.getReturnValue();
                console.log(res.Articles);
                component.set("v.News",res.Articles);
            }
            else{
                console.log(response.getMessage());
            }
        })
        $A.enqueueAction(action);
	}*/
})