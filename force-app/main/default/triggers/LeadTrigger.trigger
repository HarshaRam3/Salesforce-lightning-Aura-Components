trigger LeadTrigger on Lead (before insert) {
       CheckDuplicateEmailLeadHandler.checkingEmail(Trigger.new);
    }