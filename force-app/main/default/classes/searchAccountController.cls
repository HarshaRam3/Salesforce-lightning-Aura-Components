/* Apex Controller for the search Account 
 * Created by : Harsha M R 
 * Date : 06 Aug 2019
 */
public with sharing class searchAccountController {
 
 @AuraEnabled
 public static List < account > fetchAccount(String searchKeyWord) {
  String searchKey = searchKeyWord + '%';
  List < Account > returnList = new List < Account > ();
  List < Account > lstOfAccount = [select id, Name, Type, Industry, Phone, Fax from account
                                   where Name LIKE: searchKey LIMIT 500];
 
  for (Account acc: lstOfAccount) {
   returnList.add(acc);
  }
  return returnList;
 }
}