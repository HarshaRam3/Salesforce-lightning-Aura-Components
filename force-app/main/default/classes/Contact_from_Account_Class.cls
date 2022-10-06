public class Contact_from_Account_Class {
    public static void insertContact(List<Account> accou){
        List<Contact> cont = New List<Contact>();
        for(Account acc : accou){
            Contact con = New Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            cont.add(con);
        }
        insert cont;
    }
}