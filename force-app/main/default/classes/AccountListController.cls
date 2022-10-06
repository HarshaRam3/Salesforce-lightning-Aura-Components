public class AccountListController { 
    @AuraEnabled
    public static List < Account > fetchAccts(String objectname, String fieldname) {
        String query = ' SELECT ' +fieldname+' FROM ' + objectname+' LIMIT 10 ';
        system.debug('query'+query);
                return Database.query(query);
               
    }
}