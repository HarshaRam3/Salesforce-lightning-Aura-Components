public class WrapperTest {
    public List<AccountWrapper> AccountWrapperList{get;set;}
	    
    
    
    
    public class AccountWrapper{
        public Account acc{get;set;}
        public Boolean selectedAcc{get;set;}
        
        public AccountWrapper(Account ac){
            acc = ac;
            selectedAcc = false;
        }
    }
}