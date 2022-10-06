public inherited sharing class LWCExampleController {
    @AuraEnabled(cacheable=true)
    public static list<Opportunity> retriveOpportunities() {
        return [SELECT Id, Name, Account.Name, Account.owner.name, Owner.Name, CreatedDate FROM Opportunity LIMIT 10];
    }
}