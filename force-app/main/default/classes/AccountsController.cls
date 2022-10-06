public class AccountsController {
	@AuraEnabled
    public static List <Account> getAccounts(){
        return[SELECT Id, Name, industry,Type, NumberOfEmployees, Phone
              FROM Account 
              ORDER BY createdDate ASC];
    }
}