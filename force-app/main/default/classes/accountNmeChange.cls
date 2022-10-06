public class accountNmeChange {
    public static void changename(List<Account> ac){
        for(Account acc : ac){
        acc.name = acc.name+ ' test';
    }
    }
}