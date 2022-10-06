/*	Description : (Apex class to Retrieve the data) We will first 
 * 				  create an Apex class that will fetch all respective records. The function in the 
 * 				  class has to be annotated with ‘@AuraEnabled’ this enables the Lightning components
 * 				  to communicate with Salesforce.
 * 	Created by  : Harsha M R
 * 	Created Date: 24 jul 2019
 *  Class : RetrieveRecords.apxc
 * 	Component : RetrieveRecords_L_C.cmp
 * 	Controller : RetrieveRecords_L_CController.js
 * 	App : myapp
 * 	CSS : RetrieveRecords_L_C.css 
 */
public class RetrieveRecords {
		@AuraEnabled
    public static List<Contact> getContact(){
        return[SELECT Name
               FROM Contact
               WHERE Name != NULL];
    } 
}