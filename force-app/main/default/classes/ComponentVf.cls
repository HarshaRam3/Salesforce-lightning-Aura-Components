public with sharing class ComponentVf {
	@AuraEnabled
    public static Contact CreateNewContact(Contact con){
        upsert con;
		return con;        
    }
}