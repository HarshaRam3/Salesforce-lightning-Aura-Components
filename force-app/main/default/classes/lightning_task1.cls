public class lightning_task1 {
    @AuraEnabled
    Public static List<Account>getData(){
        List<Account> accounts = [SELECT Id,Name,Phone,Rating,Type,Ownership,Industry FROM Account];
        return accounts;
    }
    @AuraEnabled
    //it will store the selected rows of datable
    Public static map<String,String> selectedRowsRecord(Map<String,String> entierRecord,Map<String,String> PreviousValue)
    {
        for(String str : entierRecord.keyset())
        {
            PreviousValue.put(str,entierRecord.get(str));
        }
        return PreviousValue;
    }
    @AuraEnabled
    //it store the pill values
    Public Static list<String> getPileValue(String SelectedValue,list<String> PreviousValue)
    {
        PreviousValue.add(SelectedValue);
        return PreviousValue;
    }
    @AuraEnabled
    Public Static list<String> removePileValue(String selectedValue,list<String> previousValue)
    {
        for(Integer j = 0; j < previousValue.size(); j++){
            if(previousValue[j]== selectedValue){
                previousValue.remove(j);
            }
            
        }
        return previousValue;
    }
    @AuraEnabled
    // add the reacors to custom object
    Public Static void createRecord(List<String> save1,list<Account> PreviousValue)
    {
        system.debug('********value***********'+PreviousValue);
        List<dummy_account__c> DummyValue = new List<dummy_account__c>();
        
        for(integer i=0; i<PreviousValue.size();i++){
            for(Account acc:PreviousValue)
            {
                dummy_account__c aa = new dummy_account__c();
                
                aa.Name__c= acc.Name;
                aa.OWNERSHIP__c= acc.Ownership;
                aa.Phone__c= acc.Phone;
                aa.RATING__c= acc.Rating;
                DummyValue.add(aa);
                //system.debug('********145456454***********'+DummyValue);
                
            }
            
        }
        insert DummyValue;
    }
    @AuraEnabled
    public static List<Account> fetchAccount(String searchKeyWord) {
        
        String searchKey = '%'+searchKeyWord+ '%';
        List <Account> returnList = new List < Account > ();
        List <Account> lstOfAccount = [select id, Name, Type, Industry, Phone FROM account WHERE  Name LIKE: searchKey limit 10];
        
        
        for (Account acc: lstOfAccount) {
            returnList.add(acc);
        }
        return returnList;
    }
    @AuraEnabled
    public static  List<Account> SeparateFields(String datatyp, String searchstring){
        
        String objType='Account';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType accountSchema = schemaMap.get(objType);
        Map<String, Schema.SObjectField> fieldMap = accountSchema.getDescribe().fields.getMap();
        
        for (String fieldName: fieldMap.keySet()) {
            
            //get all the fields label for Account Object
            String fieldLabel = fieldMap.get(fieldName).getDescribe().getLabel();
            
            //get data types for each fields
            Schema.DisplayType fielddataType = fieldMap.get(fieldName).getDescribe().getType();
            
            if(fielddataType == Schema.DisplayType.Textarea) {
                //build your logic if the Field data type is TextArea
            }
            if(fielddataType == Schema.DisplayType.String) {
                //build your logic if the Field data type is String
                
            }
            
            if(fielddataType == Schema.DisplayType.Integer) {
                //build your logic if the Field data type is Integer
            }
            
            if(fielddataType == Schema.DisplayType.Picklist) {
                //build your logic if the Field data type is DateTime
            }
        }
        return null;
    }
}