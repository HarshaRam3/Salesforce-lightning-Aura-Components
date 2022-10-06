/* Description: This is a account search page controller
 *
 * Author: Harsha M R
 * Date : 21-july-2019
 */
public with sharing class ObjectSearchPageController {
    public String searchText           { get; set; }
    public List<Account> accountList   { get; set; }
    public List<Opportunity> opptyList { get; set; }
    public List<Case> casetList        { get; set; }
    public List<Lead> leadList         { get; set; }
    public Boolean isAcc               { get; set; }
    public Boolean isOpp               { get; set; }
    public Boolean isLead              { get; set; }
    public Boolean isCase              { get; set; }

    public String formatSearchText (String actualStr) {
        String formatStr;
        if (String.isNotBlank(actualStr)) {
            formatStr = '%' + actualStr + '%';
        } // End if
        else {
            ApexPages.addMessage(
                 new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Please provide the search keyword'));
        }
        return formatStr;
    } // End method
    
    private void clearList () {
        if (accountList != null && accountList.size() > 0) accountList.clear();
        if (opptyList != null && opptyList.size() > 0) opptyList.clear();
        if (casetList != null && casetList.size() > 0) casetList.clear();
        if (leadList != null && leadList.size() > 0) leadList.clear();
    }

    public PageReference getMatchedRecords() {
        clearList (); // clear any previous filled list
        if (addError ()) {
             ApexPages.addMessage(
                 new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Select one object!'));
        }
        else {
        if (isAcc)
            accountList = retrieveAccounts (formatSearchText(searchText));
        if (isOpp)
            opptyList = retrieveOpptys (formatSearchText(searchText));
        if (isCase)
            casetList = retrieveCases (formatSearchText(searchText));
        if (isLead)
            leadList = retrieveLeads (formatSearchText(searchText));
        }
        return null;
    }
    
    private Boolean addError () {
        if (((isAcc && isOpp) || (isAcc && isLead) || (isAcc && isCase) || 
            (isOpp && isLead) || (isOpp && isCase) || (isLead && isCase)) ||
            isAcc == false && isOpp == false && isLead == false && isCase == false)
            return true;
        else
            return false;
    } 
    private List<Account> retrieveAccounts (String accName) {
        return [Select Name, Industry, AnnualRevenue
                FROM Account WHERE Name LIKE : accName];
    } // End method
    
    private List<Opportunity> retrieveOpptys (String oppName) {
        return [Select Name, StageName, Amount
                FROM Opportunity WHERE Name LIKE : oppName];
    } // End method
    
    private List<Lead> retrieveLeads (String pLeadName) {
        return [Select Name, Status, LeadSource
                FROM Lead WHERE Name LIKE : pLeadName];
    } // End method
    
    private List<Case> retrieveCases (String pCaseName) {
        return [Select CaseNumber, Status, Priority
                FROM Case WHERE Status LIKE : pCaseName];
    } // End method
} // End class