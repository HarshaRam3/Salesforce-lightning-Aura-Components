public class AccountNameDemo {
Public List<Account> listOfAccounts{get;set;}
public boolean showAccount{get;set;}

public AccountNameDemo(){
listOfAccounts = new List<Account>();
showAccount = false;
}

public void AccountList(){
listOfAccounts = [select id,name from Account limit 50000];
showAccount = true;
}

}