public class ContactTriggerHandler {
    public static void updateAccOwner(List <Contact> conList){
        if(AccountTriggerHandler.isFirstRun == true){
            Map<Id, Contact> conIdObjMap = new Map<Id, Contact>();
    for(Contact con : conList){
        if(con.AccountId != null){
            conIdObjMap.put(con.AccountId, con);
        }
    }
    
   	    List<Account> accListToUpdate = new List<Account>();
    	for(Account acc : [SELECT Id, ownerId
                          FROM Account
                          WHERE Id IN : conIdObjMap.keySet()]){
                          acc.OwnerId = conIdObjMap.get(acc.Id).OwnerId;
                          accListToUpdate.add(acc);
         }
            AccountTriggerHandler.isFirstRun = false;
        if (accListToUpdate.size() > 0){
            update accListToUpdate;
        }
        
    }
            
   }
        
}