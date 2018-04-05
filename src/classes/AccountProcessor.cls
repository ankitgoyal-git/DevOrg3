public class AccountProcessor {

    @future
    public static void countContacts(List<Id> listAcc){
        List<Contact> listContact = [select Id,AccountId from Contact where AccountId in:listAcc];
        List<Account> ListAccount = new List<Account>();
        for(Id accId : listAcc){
            Decimal count = 0;
            For(Contact c : listContact){
                if(c.AccountId==accId)
                    count++;
            }
            Account acc = new Account(Id = accID);
            acc.Number_of_Contacts__c = count;
            ListAccount.add(acc);
        }
        update ListAccount;
    }


}