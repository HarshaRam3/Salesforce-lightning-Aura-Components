/* 
*
*/
public with sharing class ClosedCasesController {
    //A method to get all the closed cases
    public List<case> getCaseList(){
        return [SELECT Id, CaseNumber, Priority, Account.Name, Contact.Name
                FROM Case
                WHERE Status = 'Closed'];
}
}