public class LoginSignUpController {
  public Student__c student{get;set;} //Assume it to be ur custom user

public LoginSignUpController()
{
    student=new Student__c();
    
}
    public PageReference login()
    {
       if( (student__c.EmailId__c == null) || (student__c.Password__c == null))
       {
           return null;
       }
           
           List<Student__c> students= [select Id,EmailId__c,Password__c from Student__c];
        for(Student__c loginStudent:students)
        {
            if((loginStudent.EmailId__c == student.EmailId__c) && (loginStudent.Password__c == student.Password__c))
            {
                PageReference page = new PageReference('/apex/UserStart');
                page.getParameters().put('studentId', loginStudent.Id);
                page.setRedirect(true);
                return page;
            }
        }
                                   
                                   
                                   
        
        return null;
    }
    
    public PageReference signUp()
    {
       insert student;
      PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
      pageRef.setRedirect(true);
      return pageRef;

      
    }
    
    
}