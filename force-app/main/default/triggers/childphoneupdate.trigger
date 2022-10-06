trigger childphoneupdate on Account(After Update)  
    {
        AccountTriggerHandler.childPhoneUpdateMethod(Trigger.new); 
    }