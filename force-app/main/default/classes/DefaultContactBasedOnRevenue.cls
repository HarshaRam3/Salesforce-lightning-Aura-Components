public class DefaultContactBasedOnRevenue {
    public static void defaulCon(List<Account> AccList){
        List<Contact> ContList = new List<Contact>();
        for (Account acc : AccList){
            If(acc.AnnualRevenue >= 500000){
                Contact con = new Contact();
                    con.FirstName = 'Default';
                    con.LastName = 'Contact for' + acc.Name;
                    con.AccountId = acc.Id;
                    ContList.add(con);           
            }
            insert ContList;
        }
        
    }
}