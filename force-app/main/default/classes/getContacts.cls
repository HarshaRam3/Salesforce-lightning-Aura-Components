public class getContacts {
	@AuraEnabled
    public static List<Contact> getCon(){
        List<Contact> conList = [SELECT id,Name,Account.Name 
                                FROM Contact];
        return conList;
    }
}