@isTest
private class AccountProcessorTest {

	private static testMethod void test() {
	    AccountProcessor objAP= new AccountProcessor();
	    Account acc=new Account(Name = 'Ankit');
	    insert acc;
	    Contact c1 = new Contact(AccountId=acc.id,lastname = 'asd1');
	    Contact c2 = new Contact(AccountId=acc.id,lastname = 'asd2');
	    insert c1;
	    insert c2;
        List<id> listId= new List<id>();
        ListId.add(acc.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(ListId);
        Test.stopTest();
        Decimal count = [select Id,Number_of_Contacts__c from Account where Id = :acc.Id].Number_of_Contacts__c;
        System.assertEquals(2, count);
	}

}