@isTest 
public class SurveyInvitationEmailtest 
{
    static testMethod void testMethod1() 
    {
        List<Contact> lstcont= new List<Contact>();
        integer j=0;
        for(Integer i=0 ;i <10;i++)
        {
            
            j++;            
            Contact Con = new Contact();
            Con.Lastname ='LastName'+i; 
            Con.survey_date__c = date.today();
            con.Email='ashikq.ummaru@gmail.com';
            if(j>5)
            {   
            con.Languages__c ='DE';
            }
            else
            {
            con.Languages__c ='EN'; 
            }           
            lstcont.add(con);
        }
        
        insert lstcont;
        
        Test.startTest();

            SurveyInvitationEmail obj = new SurveyInvitationEmail();
            DataBase.executeBatch(obj); 
            
        Test.stopTest();
    }
}