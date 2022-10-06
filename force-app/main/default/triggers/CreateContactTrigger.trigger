trigger CreateContactTrigger on Account (after insert,after update) {
list<Opportunity> oppList = new list<Opportunity>();
list<Contact> conList = new list<Contact>();
    for(Account a : trigger.new){
        contact b = new contact();
        b.LastName = a.name;
        b.AccountId = a.Id;
        opportunity o = new opportunity();
        o.name = a.name;
        o.StageName = 'prospecting';
        o.CloseDate = System.today();
        o.AccountId = a.Id;
        conList.add(b);
        oppList.add(o);
    }
    insert conList;
    insert oppList;
    System.debug(oppList);
}