public class add_Candidate {
    @AuraEnabled
    public static void Create_Candidate(String cname, String cemail, String cphone, integer cexperience,String cposition, integer cnotice ){
        try{
            Candidate__c can = new Candidate__c();
            can.Name = cname;
            can.Email__c = cemail;
            can.Phone__c = cphone;
            can.Experience__c = cexperience;
            can.Position_Applied__c = cposition;
            can.Notice_Period__c = cnotice;
            insert can;            
        }
        catch(exception e){
            System.debug('error : '+ e.getMessage());
        }
    }
    @AuraEnabled
    public static List<String> getPositions(){
        List<Open_Position__c> listPositions = [SELECT 
                                                Name FROM 
                                                Open_Position__c];
        List<String> listNames = new List<String>();
        for(Open_Position__c ls : listPositions){
            listNames.add(ls.Name);
        }
        return listNames;
    }
    @AuraEnabled
    public static String getId(String pname){
        List<Open_Position__c> listPositions = [SELECT 
                                                id FROM 
                                                Open_Position__c WHERE Name LIKE :pname];
        String myId;
        for(Open_Position__c o : listPositions){
            myId = o.Id;
        }
        return myId;
    }
}