public class wrapperAccountAndContact {
    public List<Account> myAcc {get;set;}
    public List<Contact> myCon {get;set;}
    public wrapperAccountAndContact(List<Account> myAcc,List<Contact> myCon){
        this.myAcc = myAcc;
        this.myCon= myCon;
    }
}