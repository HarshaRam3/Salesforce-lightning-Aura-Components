({
    doInit: function(component, event, helper) {
        helper.fetchRatingPicklist(component); // fetches PickList Values of Rating Field
        helper.fetchLocalityPicklist(component); // fetches PickList Values of Locality Field
        helper.fetchGenericPicklist(component); // fetches PickList Values of Generic Field
    },
})