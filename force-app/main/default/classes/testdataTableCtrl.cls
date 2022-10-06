public class testdataTableCtrl {
    public static List<accountListWrapper> fetchAccountWrapper(){
        List<accountListWrapper> lstaccountListWrapper = new List<accountListWrapper>();
        // query account records and create 'accountListWrapper' class instance for each record. 
        for(Account acc : [Select id,name,Type,Phone From Account LIMIT 1000]){
            lstaccountListWrapper.add(new accountListWrapper(false,acc));
        }
        return lstaccountListWrapper;
    }
    /* wrapper class */
    public class accountListWrapper{
        @AuraEnabled public boolean isChecked {get;set;}
        @AuraEnabled public  account objAccount{get;set;}
        public accountListWrapper(boolean isChecked, account objAccount){
            this.isChecked = isChecked;
            this.objAccount = objAccount;
        }
        
    }
}