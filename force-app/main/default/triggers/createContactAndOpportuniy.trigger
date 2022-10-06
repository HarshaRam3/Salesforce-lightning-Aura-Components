trigger createContactAndOpportuniy on Account (after insert,after update) {
    Set<Id> accId = new Set<Id>();
    List<Contact> conList = new List<Contact>();
    List<Opportunity> oppList = new List<Opportunity>();
    
    for(Account a : Trigger.new){
        accId.add(a.id);
    }
    Map<id,Account> accMap = new Map<id,Account> ([SELECT id,name,(SELECT id,name FROM Contacts),(SELECT id,name FROM Opportunities) FROM Account WHERE id IN:accId]);

    for(Account acc : Trigger.New){
        
        if(accMap.get(acc.Id).contacts.size()<=0){
        contact con = new Contact();
        con.Lastname = acc.Name;
        con.AccountId = acc.Id;
        conList.add(con); 
        }
        
        if(accMap.get(acc.Id).opportunities.size()<=0){
        opportunity opp = new opportunity();
        opp.name = acc.name;
        opp.AccountId = acc.Id;
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today() + 30;
        oppList.add(opp); 
        }
        
    }
    insert conList;
    insert oppList;
    
}