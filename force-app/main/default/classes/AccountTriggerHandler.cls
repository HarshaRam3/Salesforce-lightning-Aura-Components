public class AccountTriggerHandler {
    public static Boolean isFirstRun = true;
    public static void updateConOwner (Map<Id, Account> accNewMap) {
        if(AccountTriggerHandler.isFirstRun == true){
            List<Contact> conListToUpdate = new List<Contact> ();
    				for (Contact con : [SELECT Id, OwnerId, AccountId
    									FROM Contact
    									WHERE AccountId IN : accNewMap.keySet()]) {
    					con.OwnerId = accNewMap.get (con.AccountId).OwnerId;
    					conListToUpdate.add (con);
    }
   			 AccountTriggerHandler.isFirstRun = false;
            if (conListToUpdate.size() > 0)
    		update conListToUpdate;
    		}
        }
    
    }