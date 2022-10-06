public class multiplePicklistsObjectFieldsController {
    @AuraEnabled
    public static Map<String, String> getObjectFields(String objName) {
        Map<String, String> retVal = new Map<String, String>();
        Map<String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(objName).getDescribe().fields.getMap();
        for (String fieldName: fieldMap.keySet()) {  
            retVal.put(fieldName, fieldMap.get(fieldName).getDescribe().getLabel());
        }
        system.debug(retVal);
        return retVal;
        
    }
    
}