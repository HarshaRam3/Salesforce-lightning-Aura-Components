public class getAccount {
	@AuraEnabled
    public static List<Account> getAcc(){
        List<Account> AccList = [SELECT id,Name,Industry 
                                FROM Account];
        System.debug('Accounts:'+AccList);
        return AccList;
    }
}