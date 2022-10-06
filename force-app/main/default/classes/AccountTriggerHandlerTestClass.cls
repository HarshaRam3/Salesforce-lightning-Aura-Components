@isTest
	public class AccountTriggerHandlerTestClass {
		// A method to test account trigger
		static testMethod void coverContactOwnerUpdateTrigger () {
		// Create data
		User adminUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
		User testUser;
            System.runAs(adminUser) {
                Profile profile = [SELECT Id FROM Profile WHERE Name = 'Custom: Sales Profile'];
                testUser = new User(
                alias = 'testUser',
                email = 'test@test.com',
                lastname = 'Jozsi',
                username = 'my_test_9999_xxxx_xxxx_xxxxx@test.com',
                emailencodingkey = 'UTF-8',
                languagelocalekey = 'en_US',
                localesidkey = 'en_US',
                profileid = profile.Id,
                timezonesidkey = 'America/New_York'
                );
                insert testUser;
                }
			Account acco = new Account (Name = 'Test acc', AnnualRevenue = 5000);
            Contact con; 

        System.runAs(testUser) {
                insert acco;
            	con = new Contact (FirstName = 'Test' , LastName = 'Contact', AccountId = acco.Id);
                insert con;
        }
            // Assertion
            System.assertEquals (testUser.Id, [SELECT OwnerId FROM Account].OwnerId);
            System.assertEquals (testUser.Id, [SELECT OwnerId FROM Contact].OwnerId);
		Test.startTest();
            acco.OwnerId = adminUser.Id;
            update acco;
		Test.stopTest();
            Contact coninstance = [SELECT OwnerId 
                                  FROM Contact 
                                  WHere ID =: con.Id];
            System.assertEquals (adminUser.Id, [SELECT OwnerId FROM Account].OwnerId);
            System.assertEquals (adminUser.Id, coninstance.OwnerId);
        }
 } // End class