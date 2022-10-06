public class getCandidates {
    @AuraEnabled
    public static List<Candidate__C> getCandidatesHere(){
        List<Candidate__c> candList = [SELECT Id, Name, Phone__c, Email__c ,Experience__c, Notice_Period__c, Position_Applied__r.Name FROM Candidate__c];
        System.debug(candList);
        return candList;
    }
    
}