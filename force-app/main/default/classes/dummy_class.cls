public with sharing class dummy_class {
    @AuraEnabled(cacheable=true)
    public static List<sobject> getsendObjectDetails(String objName) {
        String query = 'Select Id, Name, Owner.Name FROM '+objName+' LIMIT 10';
        return Database.query(query);
    }
}