trigger OppoStageUpdate on Account (after update) {
	Set<id> accid = new Set<Id>();
    for(Account a :Trigger.New){
        accid.add(a.id);
    }
    
    List<Opportunity> oppList = new List<Opportunity>();
    oppList = [SELECT id,AccountId,name,StageName,CloseDate,CreatedDate
               FROM Opportunity
               WHERE AccountId IN:accid];
    Datetime day30 = system.now() - 30 ;
    for(Opportunity op : oppList){
        If(op.CreatedDate < day30 && op.StageName!='Closed Won'){
            op.CloseDate = System.today();
            op.StageName = 'Closed Lost';
        }
    }
    update oppList;
    
}