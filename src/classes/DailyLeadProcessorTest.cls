@isTest
private class DailyLeadProcessorTest {
    
    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 200 Leads
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(lastname='Lead '+i,Company = 'ABC'));
        }
        insert leads;
    }
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

	private static testMethod void test() {
	    Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new DailyLeadProcessor());
        Test.stopTest();
        Lead l = [select LeadSource from Lead limit 1];
        system.assertEquals('Dreamforce', l.LeadSource);
	}

}