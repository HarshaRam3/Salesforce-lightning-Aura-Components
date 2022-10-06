public class AccountTriggerHandler {
    public static void childPhoneUpdateMethod(List<account> acclist){
        map<id,string> mapvar = new map<id,string>();
        List<Contact> updatedContact = new List<Contact>();
        for(Account a : accList){
            if(a.phone != null){
                mapvar.put(a.id, a.phone);
            }
        }
        list<contact> conList = [SELECT id,name,phone,Accountid 
                                FROM Contact 
                                WHERE Accountid IN: mapvar.keyset()];
        for(Contact con : conList){
            System.debug('con map :'+ con.AccountId);
            con.phone = mapvar.get(con.AccountId);
            System.debug('con phone :'+ con);
            updatedContact.add(con);
        }
        update updatedContact;
    }
}