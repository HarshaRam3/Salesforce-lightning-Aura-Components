trigger TriggerToUpdateContact on Contact (before insert) {
Set <String> accID = New Set <String> (); 
    For (Contact con: Trigger.new) { 
        if (con.AccountId != Null ) { 
        accID.add (con.AccountId); 
        } 
    } 
    If (accID.size ()> 0) { 
        List <Account> upAccList = new List <Account> (); 
        For (Account ac: [SELECT Id, Field_Update__c FROM Account WHERE id in: AccID AND Field_Update__c != true]) { 
            ac.Field_Update__c = True; 
            UpAccList.add (ac); 
        } 
        If (upAccList.size ()> 0) 
            update upAccList; 
    } 

}