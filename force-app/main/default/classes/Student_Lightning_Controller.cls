public class Student_Lightning_Controller {
 @AuraEnabled
    public static Account NewAccount(Account Accounts){
        try{       
             // Students.Teacher__c = AccountId;   
              insert Accounts;
  
        } catch (Exception ex){

    }
                System.debug('***************'+Accounts);
        return Accounts;
    }

}