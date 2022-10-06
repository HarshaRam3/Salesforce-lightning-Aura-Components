trigger PreventDuplicateContacts on Contact (before insert,before update) {
	Set<String> emailSet = new Set<String>();
    Set<String> phoneSet = new Set<String>();
    
    for(contact con : Trigger.new){
        emailSet.add(con.Email);
        phoneSet.add(con.Phone);
    }
    
    List<Contact> conList = new List<Contact>();
    conList = [SELECT email,phone 
               FROM Contact
               WHERE email IN : emailSet OR phone IN: phoneSet
               ];
    for(Contact c : Trigger.New){
    if(conList.size()>0){
        c.email.addError('Already exists');
    }
    }
}