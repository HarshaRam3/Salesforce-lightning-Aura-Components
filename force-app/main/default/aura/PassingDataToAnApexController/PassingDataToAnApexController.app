<!-- actionParamTypes.app -->
<aura:application controller="ApexParamTypesController" extends="force:slds"> 

    <lightning:button label="putstring" onclick="{!c.putstringc}"/>
    <lightning:button label="putobject" onclick="{!c.putobjectc}"/>
    <lightning:button label="putblob" onclick="{!c.putblobc}"/> 
    <lightning:button label="putlistoflistoflistofstring" onclick="{!c.putlistoflistoflistofstringc}"/>
</aura:application>