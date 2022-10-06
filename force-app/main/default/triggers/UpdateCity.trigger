trigger UpdateCity on Lead (before insert,before Update) {
Set<String> postalCodeSet = new Set<String>();
    for(Lead Lea : Trigger.new){
        if(Lea.PostalCode != null){
            postalCodeSet.add(Lea.PostalCode);
        }
      }
    
   Map<String,String> zipCityMap = new Map<String,String>();
    for(Zip_City_Map__c zipMap : [SELECT Id, City__c, Name 
                                  FROM Zip_City_Map__c 
                                  WHERE Name IN : postalCodeSet]){
        zipCityMap.put(zipMap.Name, zipMap.City__c);
        }
    
   for(Lead abLead : Trigger.new){
    if(zipCityMap.containsKey(abLead.PostalCode)){
        abLead.City = zipCityMap.get(abLead.PostalCode);
    }
   }
}