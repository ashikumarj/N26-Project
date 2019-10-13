public class ProductDisplaycontroller {
    
    @AuraEnabled
    public static List<Product2> Prddetails(List<Id> caseIdss) {
        // Getting the Contact from caseId  
                try
                {             
                List<case> Casedetail = [SELECT Id,contact.Product__c,contact.Home_Country__c FROM case WHERE id in :caseIdss]; 
                List<Product2> PDetails = new List<Product2>();                
                String Prdid=Casedetail[0].contact.Product__c; 
                String Country = Casedetail[0].contact.Home_Country__c;
                system.debug('Prdid::'+Prdid);
                system.debug('Country::'+Country);
                if(!Casedetail.isEmpty())
                {               
                PDetails=[SELECT Id,Name,Country__c,Cost_per_Calendar_Month__c,Card_Replacement_Cost__c,ATM_Fee_in_other_currencies__c FROM Product2 WHERE id =:Prdid AND Country__c=:Country];
                system.debug('PDetails::'+PDetails);                
                }
                // Returning the Trips list
                return PDetails;
                }
                catch (Exception e) 
                {
                        // "Convert" the exception into an AuraHandledException
                        throw new AuraHandledException('OOPS! Something went wrong: '
                            + e.getMessage());    
              }
    }

}