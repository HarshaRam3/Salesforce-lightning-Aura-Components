trigger Contact_from_Account on Account (after insert) {
    Contact_from_Account_Class.insertContact(Trigger.New);
}