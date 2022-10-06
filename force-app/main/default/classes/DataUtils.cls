public class DataUtils {
    //pass object name and Id to get all fields for sObject record
    public static sObject getObject(string objName, string id) {

        String fieldnames = '';
        sObject obj;
        try {
            Map < String, Schema.SObjectType > m = Schema.getGlobalDescribe();
            Schema.SObjectType s = m.get(objName);
            Schema.DescribeSObjectResult r = s.getDescribe();

            //get fields
            Map < String, Schema.SObjectField > fields = r.fields.getMap();
            for (string field: fields.keySet()) {
                if (fieldnames == '') {
                    fieldnames = field;
                } else {
                    fieldnames += ',' + field;
                }
            }

            //create SQL
            String sql = 'SELECT ' + fieldnames + ' FROM ' + objName + ' WHERE Id=\'' + id + '\'';
            System.debug(sql);
            obj = database.query(sql);

        } catch (Exception e) {
            System.debug('get Fields Error' + e.getMessage());
            ApexPages.addMessages(e);
            return null;
        }
        return obj;
    }
}