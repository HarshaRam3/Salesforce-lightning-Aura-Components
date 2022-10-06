/*This InsertDefaultContactClass trigger 
 * which creates a default contact if the revenue is more than 5000000
 * created by : Harsha
 * 20 july 2019
 */trigger InsertDefaultContactClass on Account (after insert) {
	 InsertDefaultContactClass.createContact(Trigger.new);
    }