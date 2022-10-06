@isTest
public class Contact_from_Account_Class_TestClass {
    @testsetup
    public static void data_setup(){
        integer i=0;
        List<Account> accList = new List<Account>();
        for(i=0;i<2;i++){
            Account Acc = New Account();
            acc.name = 'Accname' +i ;
            accList.add(acc);
        }
       insert accList;
    }
    public static testmethod void testinsert(){
       List<Account> ac = [SELECT id,Name 
                           FROM Account];
	   System.debug('Accounts :'+ac);
       Contact_from_Account_Class.insertContact(ac);
    }
}