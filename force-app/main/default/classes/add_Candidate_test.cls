@isTest
public class add_Candidate_test {
    @testSetup
    public static void createCandidates(){
        List<Open_Position__c> candList = new List<Open_Position__c>();
        integer i =0;
        for(i=0;i<5;i++){
            Open_Position__c cand = new Open_Position__c();
            cand.Name = 'TestCandidate' + i;
            candList.add(cand);
        }
        insert candList;
    }
    
    public static void Create_Candidate(String CFirstName,String CLastname,String Cemail, String CPhone, String Ctitle, Id Cacid){
        Account a = new Account();
        a.Name = 'test';
        insert a;
        
        candidate__c can = new candidate__c();
        
    }
    
    
}