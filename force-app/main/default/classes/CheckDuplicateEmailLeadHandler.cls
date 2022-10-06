/**
*Description : while creating Lead we need to check email already exsit or not then insert email
*
*Created Date : 20 july 2019
*Created By : Harsha M R
**/
public class CheckDuplicateEmailLeadHandler {
        public static void checkingEmail(List<Lead> LeadList){
				Set <String> leadEmailSet = new Set <String> ();
					for (Lead aLead : LeadList){
						if (aLead.Email != null){
							leadEmailSet.add (aLead.Email);
							}
						}

				Set<String> emailExitset = new Set<String> ();
				for(Lead leadExist : [SELECT Id,Email 
                                      FROM Lead 
                                      WHERE Email IN : leadEmailSet]){
					emailExitset.add (leadExist.Email);
					}

				for(Lead ld : LeadList){
					if(emailExitset.contains(ld.Email)){
							ld.addError ('Duplicate Lead');
						}
					}
			} // End trigger
    }