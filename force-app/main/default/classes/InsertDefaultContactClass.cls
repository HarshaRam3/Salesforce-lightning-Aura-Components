/* This class is a handler class of InsertDefaultContactClass trigger 
 * which creates a default contact if the revenue is more than 5000000
 * created by : Harsha
 * 20 july 2019
 */
  public class InsertDefaultContactClass {
    public static void createContact(List<account> accList){
       List<Contact> ContList = new List<Contact>();
        for (Account acc : accList){
            If(acc.AnnualRevenue >= 500000){
                Contact con = new Contact();
                    con.FirstName = 'Default';
                    con.LastName = acc.Name;
                    con.AccountId = acc.Id;
                    ContList.add(con);           
            }
            insert ContList;
        }
    }
}