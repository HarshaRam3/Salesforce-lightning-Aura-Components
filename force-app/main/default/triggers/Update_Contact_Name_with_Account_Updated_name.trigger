trigger Update_Contact_Name_with_Account_Updated_name on Account (after update) {
    List<Contact> conList = New List<Contact>();
    for(Account ac : Trigger.New){
        List<Account> con = [SELEcT id, name, (Select name from Contacts) from account];
        system.debug(con);
    }
}