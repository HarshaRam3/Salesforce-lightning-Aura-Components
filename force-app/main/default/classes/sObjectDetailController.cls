/* Description :  Apex class to query records from the Database
 */
public with sharing class sObjectDetailController {
    @AuraEnabled(cacheable=true)
    public static List<sobject> getsendObjectDetails(String objName) {
        String query = 'Select Id, Name, Owner.Name, LastModifiedById FROM '+objName;
        return Database.query(query);
        
    }
}