public class ApexParamTypesController { 
    @AuraEnabled
    public static String pstring(String v){
        System.debug(v.capitalize());
        return v;
    }
    @AuraEnabled
    public static Object pobject(Object v){
        System.debug(v);
        return v;
    }
    @AuraEnabled
    public static Blob pblob(Blob v){
          System.debug(v.toString());
        return v;
    }      
    @AuraEnabled
    public static List<List<List<String>>> plistoflistoflistofstring(List<List<List<String>>> v){
        System.debug(v);
        return v;
    }       
}