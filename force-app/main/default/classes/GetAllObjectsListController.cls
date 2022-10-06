public class GetAllObjectsListController {
 Public string SelectedObject{get;set;}
 Public Map<String, Schema.SObjectType> AllObjectMap;
 Public GetAllObjectsListController(){
    AllObjectMap = New Map<String, Schema.SObjectType>();
    AllObjectMap = Schema.getGlobalDescribe();
}
Public List<selectoption> getAllObjList(){
    List<selectoption> SobjectList = new List<selectoption>();
    for(string s:AllObjectMap.keyset()){
        SobjectList.add(new selectoption(s,s));
    }
  return SobjectList;   
 }
}