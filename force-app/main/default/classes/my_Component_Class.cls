public class my_Component_Class {
@AuraEnabled
    public static List<String> objectNames(){
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();    
        List<String> options = new List<String>();
        for(SObjectType f : gd){
            options.add(f.getDescribe().getName());
            options.sort();        
        }
        return options;
    }    
    @AuraEnabled
    public static List < Account > fetchAccts(String objectname, String fieldname) {
        String query = ' SELECT ' +fieldname+' FROM ' + objectname;
        system.debug('ygduygav'+query);
                return Database.query(query);
               

}
}