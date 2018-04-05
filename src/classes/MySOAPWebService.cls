global with sharing class MySOAPWebService {
    webservice static Garage__c getRecord(String id) {
        // Add your code
        Garage__c acc = [select Id,name from Garage__c where Id=:id];
        return acc;
    }
}