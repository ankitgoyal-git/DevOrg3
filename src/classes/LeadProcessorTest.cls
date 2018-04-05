@isTest
private class LeadProcessorTest {
    
    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 200 Leads
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(lastname='Lead '+i,Company = 'ABC'));
        }
        insert leads;
    }

 static testMethod void test() {
	    Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        System.assertEquals('Dreamforce', [Select LeadSource from Lead limit 1].LeadSource);
	}

}