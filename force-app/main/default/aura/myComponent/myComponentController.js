/* Setting column information.To make a column sortable,
 *     set sortable as true on component load
 * Created by : Harsha M R 
 * Date : 30 july 2019
 */
     ({    
    doInit: function(component,event,helper){
        var action = component.get('c.getContacts');
//        action.setCallback() sets a callback action that is 
//        invoked after the server-side action returns.
        action.setCallback(this, function(res){
            var state = res.getState();
            if(state === 'SUCCESS' && component.isValid()){
                //get contact list
                component.set('v.conList', res.getReturnValue());
            }else{
                alert('ERROR...');
            }
        });
        $A.enqueueAction(action);
    }
})