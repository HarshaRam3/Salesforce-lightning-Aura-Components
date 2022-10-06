@isTest
public class AccountCard_controller_test {
    @testsetup
    static void getaccsetup(){
        integer i=0;
        List<Account> accList = new List<Account>();
        for(i=0;i<2;i++){
            Account Acc = New Account();
            acc.name = 'Accname' +i ;
            accList.add(acc);
        }
        insert accList;
        
    }
    public static testmethod void getacc(){
        //Account a = [SELECT id, name, type, phone, Website, Industry FROM Account LIMIT 1 ];
        //system.debug(a.id);
        //return a;
        AccountCard_controller.getacc();
    }
    public static testmethod void createContact(){
        String CFirstName = 'Testuser';
        String CLastname = 'test user last name';
        String Cemail = 'h@gmail.com';
        String CPhone = '9877667788';
        String Ctitle = 'Developer';
        Account acc = [SELECT id
                       FROM Account 
                       LIMIT 1];
        id Cacid = acc.Id;
        AccountCard_controller.createContact(CFirstName, CLastname, Cemail, CPhone, Ctitle, Cacid);
    }
    public static testmethod void createContactNegative(){
        String CFirstName = 'Testuser';
        String CLastname = 'test user last name';
        String Cemail = 'error';
        String CPhone = '9877667788';
        String Ctitle = 'Developer';
        Account acc = [SELECT id
                       FROM Account 
                       LIMIT 1];
        id Cacid = acc.Id;
        AccountCard_controller.createContact(CFirstName, CLastname, Cemail, CPhone, Ctitle, Cacid);
    }
}