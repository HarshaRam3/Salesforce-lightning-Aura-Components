<aura:application extends="force:slds">
  <!--<aura:attribute name="selectedLookUpRecords" type="sObject[]" default="[]"/>
 
  <c:reUsableMultiSelectLookup objectAPIName="Account"
                               IconName="standard:Account"
                               lstSelectedRecords="{!v.selectedLookUpRecords}"
                               label="Account Name"/>
      <c:reUsableMultiSelectLookup objectAPIName="Contact"
                               IconName="standard:Contact"
                               lstSelectedRecords="{!v.selectedLookUpRecords}"
                               label="Contact Name"/>
    here c: is org. namespace prefix
    <c:DynamicBindingDemo objectList="Account"/>-->
    <c:sortableAccountTable/>
</aura:application>