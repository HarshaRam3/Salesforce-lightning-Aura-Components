({
  getRecord : function(component) {
   var fields = component.get('v.fieldsToShow');
   var recordId = component.get('v.recordId');
   var action = component.get('c.getRecords');
   var fieldList = fields.split(',');
   var fieldMap = new Object();
   console.log(fieldList);
   component.set("v.fieldsToShow",fieldList);
      
     $A.enqueueAction(action);
 }
})