public class demoDynamicDataTableController {
    @AuraEnabled
    public static List<Contact> getContact(){
        return [Select Id,Name,Phone from Contact];
    }
}