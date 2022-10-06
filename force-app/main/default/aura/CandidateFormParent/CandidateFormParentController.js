({
    showMe : function(component, event, helper) {
        var candidate = event.getParam("candi");
       /* console.log("Name",candidate.Name);
        console.log("Phone__c",candidate.Phone__c);
        console.log("Email__c",candidate.Email__c);
        console.log("Experience__c",candidate.Experience__c);
        console.log("Notice_Period__c",candidate.Notice_Period__c);
        console.log("Position_Applied__c",candidate.Position_Applied__c);*/
        console.log("positionId");
        var candiList = component.get("v.cand");
        candiList.push(candidate);
        component.set("v.cand",candiList);
    },
    
    doInit : function(component, event, helper){
        var columns = [
            {label:'Candidate Name', fieldName:'Name', type:'Text'},
            {label:'Candidate Phone', fieldName:'Phone__c', type:'Text'},
            {label:'Candidate Email', fieldName:'Email__c', type:'Text'},
            {label:'Candidate Experience', fieldName:'Experience__c', type:'Text'},
            {label:'Candidate Notice', fieldName:'Notice_Period__c', type:'Text'},
            {label:'Candidate Position', fieldName:'Position_Applied__c', type:'Text'}
        ];
        component.set("v.columns",columns);
    }
})