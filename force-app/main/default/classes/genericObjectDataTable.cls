public with sharing class genericObjectDataTable {
   //@AuraEnabled
   // public static List<sobject> getsendFieldsDetails(String fieldNames) {
        
     // String name = 'Biswajeet, Abhijeet, Arijeet, Subhojeet';
     // List<String> lstName = fieldNames.split(',');
      //System.debug(lstName);
    //    return lstName;
      //  String query = 'Select Id, Name, Owner.Name,OwnerId,Phone,LastModifiedById FROM '+objName;
        //return Database.query(query);
    //}
    
    
    @AuraEnabled(cacheable=true)
    public static List<sobject> getsendObjectDetails(String objName) {
        String query = 'Select Id, Name, Owner.Name,OwnerId,Phone,LastModifiedById FROM '+objName;
        return Database.query(query);
    }
}