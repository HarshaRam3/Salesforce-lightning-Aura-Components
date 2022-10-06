public class InsertContact {
    @AuraEnabled
    public static Contact createContact(Contact cont, Id AccountId){
        cont.AccountId = AccountId;
        insert cont;
        return cont;
    }
}