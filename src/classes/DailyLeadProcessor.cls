global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> listLead = [select Id,leadSource from Lead where leadSource ='' limit 200];
        for(Lead l:listLead){
            l.leadSource = 'Dreamforce';
        }
        update listLead;
    }

}