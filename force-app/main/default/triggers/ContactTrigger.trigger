trigger ContactTrigger on Contact (after update) {
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isupdate)){
    ContactTriggerHandler.updateAccOwner(Trigger.new);
    }
  /*  if(Trigger.isbefore && Trigger.isUpdate){
        
    }*/
    //solution for recursive trigger (Trigger a call b <-> Trigger b call a) 
}