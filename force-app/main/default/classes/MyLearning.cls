public class MyLearning {
//    String ObjectName = 'Account';
    public static List<Account> AllAccounts(String ObjectName){
        //String Oname = ObjectName;
       // List<String> 
        String query1 = 'SELECT id, name FROM '+ObjectName+' LIMIT 10';
        List<Account> acc = Database.query(query1);
        System.debug(acc);
        return acc;
    }
}