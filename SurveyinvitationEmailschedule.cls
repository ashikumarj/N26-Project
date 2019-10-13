/***********************************
@Author: Ashik
@Date: 11-Oct-2019
@Description: Schdeuler Class for batch class SurveyinvitationEmail to send invitation to contacts with survey date
@Change History:        
***********************************/

global class SurveyinvitationEmailschedule implements Schedulable
{
    global void execute(SchedulableContext sc)
    {
              
        //Call the batch class to be scheduled
        SurveyInvitationEmail objSchedule = new SurveyInvitationEmail();       
        //Parameters of ExecuteBatch(context,BatchSize)
        database.executebatch(objSchedule,200);
    }
   
}