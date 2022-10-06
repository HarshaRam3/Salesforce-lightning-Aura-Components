public class DetailController {
    @AuraEnabled
    public static Sobject getRecords(Id recordId, String fieldsToShow) {
        String objectName = recordId.getSobjectType().getDescribe().getName();
        String soql = 'Select ' + fieldsToShow + ' from ' + objectName + ' where Id = :recordId';
        Sobject rec = Database.query(soql);
        return rec;
    }
}