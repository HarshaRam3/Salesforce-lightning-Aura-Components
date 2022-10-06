trigger accountNameChange on Account (before insert, before update) {
	//List<Account> myAcc = new List<Account>();
    accountNmeChange.changename(Trigger.New);
}