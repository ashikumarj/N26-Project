/***********************************
@Author: Ashik
@Date: 11-Oct-2019
@Description:Batch class to send invitation to contacts with survey date
@Change History:        
***********************************/

global class SurveyInvitationEmail implements Database.Batchable<Contact> {
     
     global Iterable<Contact> start(Database.BatchableContext bc)
     {
     /** The Limit is set to 5 as in Developer org limit is 10 per days in Normal circumstances it will be set to 5000 **/ 
     list<Contact> Conlist=[select id,Languages__c,FirstName from Contact where survey_date__c <=: date.today() And Email!=null  AND survey_date__c!=null limit 5];
     system.debug('******'+Conlist);        
     return Conlist;
     }
     global  void execute(Database.BatchableContext bc, List<Contact> lst)
     {  
            Try
            {
            EmailTemplate SurveyEngEmailTemplate = [select Id, Body  from EmailTemplate where DeveloperName = 'Survey_Email_Template_English']; 
            EmailTemplate SurveyGerEmailTemplate = [select Id, Body  from EmailTemplate where DeveloperName = 'Survey_Email_Template_German'];
            List<contact> ConToUpdate = new List<contact>();
            list<Messaging.SingleEmailMessage> mail = new list<Messaging.SingleEmailMessage>();
              for(Contact conobj: lst)
              {
                Messaging.SingleEmailMessage objEmail = new Messaging.SingleEmailMessage();
                objEmail.setTargetObjectId(conobj.id);          
                if(conobj.Languages__c=='DE')
                {
                    objEmail.setTemplateId(SurveyGerEmailTemplate.Id);
                }
                else
                {
                    objEmail.setTemplateId(SurveyEngEmailTemplate.Id);
                }   
                conobj.survey_date__c=null;         
                mail.add(objEmail);  
                ConToUpdate.add(conobj);
              }           
                Messaging.SendEmailResult[]  result =Messaging.sendEmail(mail);
                if( !ConToUpdate.isEmpty()) 
                {
                    UPDATE ConToUpdate;
                }
      }
         Catch(Exception e)
        {
         System.debug('Exception:'+e);
        } 
     }
       
     global void finish(Database.BatchableContext BC)
     {
    
     }     
    
}