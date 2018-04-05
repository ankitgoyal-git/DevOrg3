global class LeadProcessor implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,LeadSource from Lead');
    }
    global void execute(Database.BatchableContext bc, List<Lead> listLead){
        for(Lead l : listLead){
            l.LeadSource = 'Dreamforce';
        }
        update listLead;
    }
    global void finish(Database.BatchableContext bc){
        System.debug('Inside Finish...');
    }
}