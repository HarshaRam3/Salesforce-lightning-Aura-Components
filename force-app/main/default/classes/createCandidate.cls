public class createCandidate {
    @AuraEnabled
    public static List<Open_Position__c> getOpenPositions(){
        List<Open_Position__c> openPosition = new List<Open_Position__c>();
        openPosition = [SELECT Name 
                        FROM Open_Position__c];
        System.debug(openPosition);
        return openPosition;
    }
    @AuraEnabled
    public static List<String> getOpenPositionsAsString(){
        List<Open_Position__c> openPosition = new List<Open_Position__c>();
        List<String> posList = new List<String>();
        openPosition = [SELECT Name 
                        FROM Open_Position__c];
        
        for(Open_Position__c op : openPosition){
            System.debug(op);
            posList.add(op.Name);
        }
       // posList.push(openPosition.Name);
       	system.debug('Position List'+posList);
        return posList;
    }
    
    @AuraEnabled
    public static String getId(String posName){
		List<Open_Position__c> Op = [SELECT id From Open_Position__c where name LIKE :posName LIMIT 1];
        String myId;
        for(Open_Position__c o : Op){
            myId = o.Id;
        }
        system.debug(myId);
        return myId;
    }
    
    @AuraEnabled
    public static void createCandidat(Candidate__c can){
        Try{
            
            insert can;
            system.debug(can);
        }
        catch(exception e){
            System.debug(e.getMessage());
        }
    }
}