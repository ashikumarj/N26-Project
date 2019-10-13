@IsTest
Public Class ProductDisplaycontrollerTest
{
static testMethod void ProductDispcontrollerTest()
{ // no need to make your test method public     
    Product2 Prd = new Product2(Name='Test Product',Country__c='UK');
    list<id> cid=new list<id>();
    insert prd;
    contact Conobj=new contact(Lastname='test contact',Home_Country__c='UK',Product__c=prd.id);
    insert Conobj;  
    Case CasObj = new Case(status='New',Origin='Phone',ContactId=Conobj.id);
    insert CasObj; 
    cid.add(CasObj.id);
    Test.startTest();
        // don't forget to wrap the operation you test in startTest/stopTest        
    ProductDisplaycontroller.Prddetails(cid);	 
    Test.stopTest();
    
    // don't forget your assertions!
}
}