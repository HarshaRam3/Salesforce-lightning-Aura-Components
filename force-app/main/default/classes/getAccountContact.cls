public class getAccountContact {
    /*public static void addData(){
        List<wrapperAccountAndContact> newList = new List<wrapperAccountAndContact>();
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        Account a = new Account();
        a.Name = 'Acc1';
        accList.add(a);
        Account b = a.clone();
        b.Name = 'Acc2';
        accList.add(b);
        Contact c1 = new Contact();
        c1.LastName = 'Con1';
        Contact c2 = new COntact();
        c2.LastName = 'Con2';
        conList.add(c1);
        conList.add(c2);        
    }*/
    
    public static List<wrapperAccountAndContact> getAccountContact(List<Account> acc, List<Contact> con){
        List<wrapperAccountAndContact> newList = new List<wrapperAccountAndContact>();
        wrapperAccountAndContact data = new wrapperAccountAndContact(acc,con);
        newList.add(data);
        for(wrapperAccountAndContact n : newList){
           System.debug('data : =='+ newList); 
        }
        
        return newList;
    }
    
    
    
}