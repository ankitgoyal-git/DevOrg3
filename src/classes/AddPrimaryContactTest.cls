@isTest
private class AddPrimaryContactTest {
    
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        
        // insert 50 Accounts
        for (Integer i=0;i<50;i++) {
            accounts.add(new Account(Name='Account '+i,BillingState = 'CA'));
        }
        insert accounts;
    }

	private static testMethod void test() {
	    Contact con = new Contact (lastname = 'test1');
	    insert con;
        Test.startTest();
        AddPrimaryContact apc = new AddPrimaryContact(con,'CA');
        System.enqueueJob(apc);
        Test.stopTest();
        
        Decimal count = [Select count() from Contact where Account.BillingState = 'CA'];
        System.assertEquals(50, count);
	}

}