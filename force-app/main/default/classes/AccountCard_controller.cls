public class AccountCard_controller {
    @AuraEnabled
    public static Account getacc(){
        Account a = [SELECT id, name, type, phone, Website, Industry FROM Account LIMIT 1 ];
        return a;
    }
    @AuraEnabled
    public static String createContact(String CFirstName,String CLastname,String Cemail, String CPhone, String Ctitle, Id Cacid){
        String result; 
        Try{
            Contact con = new Contact();
            con.FirstName = CFirstName;
            con.LastName = CLastname;
            con.Email = Cemail;
            con.Phone = CPhone;
            con.Title = Ctitle;
            con.AccountId = Cacid;	
            insert con;
            Result = 'Contact Details '+con.Id;
            System.debug(Result);
        }
        catch(exception e){
            Result = 'creation failed'+e.getMessage();
            System.debug(Result);
        }
        return Result;
    }
}