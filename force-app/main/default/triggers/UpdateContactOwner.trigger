trigger UpdateContactOwner on Account (after update) {
if (Trigger.isAfter && Trigger.isUpdate) {
AccountTriggerHandler.updateConOwner (Trigger.newMap);
}
}