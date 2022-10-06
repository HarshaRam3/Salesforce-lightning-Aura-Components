({
    fetchRecords : function(component, event) {
        var action = component.get("c.objectRecords");
        action.setParams({
            selectedObject:component.get("v.selectedValue"),
            sortingOrder : component.get("v.sortedDirection"),
            sortingField : component.get("v.sortedBy")
        });

        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var allValues = response.getReturnValue();
                var objectValue = allValues.sObjectData;
                var fieldList = allValues.fieldList;
                var currentData = component.get('v.data');
                console.log('fieldList+++'+JSON.stringify(fieldList));
                component.set("v.listSkillsOptions",fieldList);
                component.set("v.data",objectValue);
            }
        });
        $A.enqueueAction(action);
    }
})