@isTest
public class CheckDuplicateEmailLeadTestClass {
    Static testMethod void Checkingduplicatenames(){
        Lead lead = new Lead(FirstName = 'Test First', LastName = 'Test Last', 
                             Email = 'test@abc.com', Company = 'Test Company'); 
        insert Lead;
       	 List<Lead> leadList = new List<Lead>();
         String pref = '';
        	for(Integer i = 0; i < 3; i++){
            	leadList.add(new Lead(FirstName = pref + 'Test First2', LastName = pref + 'Test Last2', 
                             Email = pref + 'test@abc.com', Company = pref + 'Company'));
                pref += i;
        		}
        try{
            Database.insert (leadList, false);
        } catch(Exception e){
            System.assertNotEquals(null, e.getMessage());
            System.assertEquals(true, e.getMessage().contains('Duplicate Lead'));
           } 
        System.assertEquals(3, [SELECT COUNT() FROM Lead]);
    }
}