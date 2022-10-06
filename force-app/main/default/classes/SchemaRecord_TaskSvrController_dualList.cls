public class SchemaRecord_TaskSvrController_dualList {
    public class DynamicBindingWrapper{
        @AuraEnabled
        public List<sObject> sObjectData {get; set;}
        @AuraEnabled
        public List<fieldDataWrapper> fieldList {get; set;}
    }
    
    public class fieldDataWrapper{
        
        @AuraEnabled
        public String value {
            get;
            set;
        }
        
        @AuraEnabled
        public String label {get; set;}
    }
    
    @AuraEnabled
    public static List<String> objectNames(){
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
        system.debug('gd'+gd);
        List<String> options = new List<String>();
        for(SObjectType f : gd){
            options.add(f.getDescribe().getName());
            options.sort();
        }
        return options;
    }
    
    @AuraEnabled
    public static DynamicBindingWrapper objectRecords(String selectedObject, String sortingOrder, String sortingField){
        
        System.debug('Selected Object'+selectedObject);
        System.debug('Selected Order'+sortingOrder);
        System.debug('Selected Field'+sortingField);
        
        DynamicBindingWrapper dynamicData = new DynamicBindingWrapper();
        List<fieldDataWrapper> wrapperList = new List<fieldDataWrapper>();
        List<String> fields = new List<String>();
        Map<String , Schema.SObjectType> globalDescription = Schema.getGlobalDescribe();
        Schema.sObjectType objType = globalDescription.get(selectedObject);
        Schema.DescribeSObjectResult r1 = objType.getDescribe();
        
        Map<String , Schema.SObjectField> mapFieldList = r1.fields.getMap();
        
        for(Schema.SObjectField field : mapFieldList.values()) {
            Schema.DescribeFieldResult fieldResult = field.getDescribe();
            
            if(fieldResult.isAccessible()) {
                fields.add(fieldResult.getName());
            }
            fieldDataWrapper wrapper = new fieldDataWrapper();
            wrapper.label = field.getDescribe().getLabel();
            wrapper.value = field.getDescribe().getName();
            wrapperList.add(wrapper);
        }
        Integer i = 0;
        String fieldsToFetch = '';
        for(String temp:fields){
            Integer len = fields.size();
            if(i==len-1){
                fieldsToFetch = fieldsToFetch + temp;
            }
            else{
                fieldsToFetch = fieldsToFetch + temp + ',';
            }
            i++;
        }
        String sql = ' SELECT ' + fieldsToFetch + ' FROM ' + selectedObject + ' ORDER BY ' + sortingField + ' ' +sortingOrder;
        system.debug(sql);
        List<Sobject> objRecords = new List<Sobject>();
        objRecords = Database.Query(sql);
        System.debug('objRecords--->' + objRecords);
        if(objRecords!=null && objRecords.size()>0){
            dynamicData.sObjectData = objRecords;
        }
        else{
            dynamicData.sObjectData = new List<sObject>();
        }
        dynamicData.fieldList = wrapperList;
        System.debug('dynamicData.sObjectData--->' + dynamicData.sObjectData);
        System.debug('dynamicData.fieldList--->' + dynamicData.fieldList);
        System.debug('dynamicData--->' + dynamicData);
        return dynamicData;
    }
    
    
}