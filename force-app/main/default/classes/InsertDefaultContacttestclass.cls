/* Test class to test the trigger InsertDefaultContact whenever we create the account with the annual revenue above 500000
 * Need to be updated by harsha
 * 20 july 2019
 */
@isTest
public with sharing class InsertDefaultContacttestclass{
    //A method to test InsertDefaultContactClass
    Static testMethod void coverdefaultcontact(){
       //Create data
        Account acc = new Account (Name = 'Tester', AnnualRevenue = 500000);
        insert acc;
        //Assertions
        list<Contact> contList = [SELECT Id, FirstName, LastName, AccountId
                                 FROM Contact];
   	    System.assertEquals(1,contList.size());
	    System.assertEquals('Default', contList.get(0).FirstName);
        System.assertEquals(acc.Name, contList.get(0).Lastname);
		System.assertEquals(acc.Id, contList.get(0).AccountId);
    } //End Method
}//End Class