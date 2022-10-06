public class MultiCheckBoxExtn {
    public opportunity opp{get;set;}
    public List<SelectOption> leadSourceCheckbox {get;set;}
    
    public MultiCheckBoxExtn(ApexPages.StandardController controller) {
        opp = (opportunity)controller.getRecord();
    }
    
    public void saveOpp(){
    system.debug('opp.Multi_select_picklist__c==>'+opp.Multi_select_picklist__c);
     upsert opp;
    }
    
    
  
 //get the multi-select pick list values
    public List<SelectOption> MPOptions {
     get {
       List<SelectOption> options = new List<SelectOption>();
       for( Schema.PicklistEntry f : opportunity.Multi_select_picklist__c.getDescribe().getPicklistValues()) {
         options.add(new SelectOption(f.getValue(), f.getLabel()));
        } 
       return options;
     }  
     set;
    }
    
    
    //get and set the multi-select pick list as checkboxes
       public String[] MPItems { 
     get {
        String[] selected = new List<String>();
        List<SelectOption> sos = this.MPOptions;
        for(SelectOption s : sos) {
        if (this.opp.Multi_select_picklist__c !=null && this.opp.Multi_select_picklist__c.contains(s.getValue()))
           selected.add(s.getValue());
        }
        return selected;
     }public set {
        String selectedCheckBox = '';
        for(String s : value) {
         if (selectedCheckBox == '') 
           selectedCheckBox += s;
         else selectedCheckBox += ';' + s;
        }
        opp.Multi_select_picklist__c = selectedCheckBox;
     }
   } 
 }