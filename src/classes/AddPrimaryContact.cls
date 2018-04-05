public class AddPrimaryContact implements Queueable {
    
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }

    public void execute(QueueableContext context) {
        List<Contact> listContact = new List<Contact>();
        for (Account acc : [Select Id from Account where BillingState= :state limit 200]) {
            Contact clonedContact = contact.clone(false, false, false, false);
            clonedContact.AccountId = acc.Id;
            listContact.add(clonedContact);
          // perform other processing or callout
        }
        insert listContact;
    }

}