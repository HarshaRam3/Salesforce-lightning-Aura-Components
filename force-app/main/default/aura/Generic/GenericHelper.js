({
  getRecord : function(component) {
  /* var fields = component.get('v.fieldsToShow');
   var fieldList = fields.split(',');
   var fieldMap = new Object();
   console.log(fieldList);
   component.set('v.fieldList',fieldList);
   action.setParams({
     recordId:recordId,
     fieldsToShow:fields
   });
   $A.enqueueAction(action);

   action.setCallback(this,function(a){
     console.log(a.getReturnValue());
     var sobjectrecord = a.getReturnValue();
     for (var idx in fieldList) {
       console.log(fieldList[idx]);
       console.log(sobjectrecord[fieldList["idx"]]);
       $A.createComponent(
         {
           "label": fieldList[idx] 
          //   "value": sobjectrecord[fieldList["idx"]],
          // "class": outputCls
         },
         function(newCmp){
            //Add the field list to the body array
            if (component.isValid()) {
               var body = component.get("v.body");
               body.push(newCmp);
               component.set("v.body", body);
         }
       }
    );
  }
  component.set("v.detailRecord",a.getReturnValue());
 });
 $A.enqueueAction(action);*/
 }
})