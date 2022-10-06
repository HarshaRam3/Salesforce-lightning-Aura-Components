public class FireClass {
    @AuraEnabled
    public static List<String> objectNames(){
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();    
        List<String> options = new List<String>();
        for(SObjectType f : gd){
            options.add(f.getDescribe().getName());
            options.sort();        
        }
        System.debug(options);
        
        return options;
    }    
    
    @AuraEnabled
    public static List<String> objectFields(){
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();    
        List<String> options1 = new List<String>();
        for(SObjectType fields : gd){
            options1.add(fields.getDescribe().getName());
            options1.sort();        
        }
        System.debug(options1);
        return options1;
        
    }    
    @AuraEnabled
    public static Map<String, String> getObjectFields(String objName) {
                System.debug('Selected Object'+objName);

        Map<String, String> retVal = new Map<String, String>();
        Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(objName).getDescribe().fields.getMap();
        for (String fieldName: fieldMap.keySet()) {  
            retVal.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        system.debug(retVal);
        return retVal;
        
    }
    
    
    @AuraEnabled
    public static List < sObject > fetchAccts(String objectname, String fieldname, String sortingOrder, String sortingField) {
        System.debug('Selected Object'+objectname);
        System.debug('Selected fieldname'+fieldname);
        System.debug('Selected sortingOrder'+sortingOrder);
        System.debug('Selected sortingField'+sortingField);
        
        String query = ' SELECT ' +fieldname+' FROM ' + objectname+ ' ORDER BY '+sortingField+' '+sortingOrder;
        System.debug('query'+query);
        return Database.query(query);
        
    }
    
    
}