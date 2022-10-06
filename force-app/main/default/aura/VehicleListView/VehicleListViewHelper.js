({
    /**
     * Webkul Software.
     *
     * @category  Webkul
     * @author    Webkul
     * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
     * @license   https://store.webkul.com/license.html
     */
     
    getVehicle : function(component) {
        var action = component.get("c.getVehicleList");//get data from controller
        action.setCallback(this, function(a) {
            component.set("v.vehicles", a.getReturnValue());//set data in the page variable
        });
        $A.enqueueAction(action);
    }
})