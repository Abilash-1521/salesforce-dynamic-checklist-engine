public with sharing class StageSyncService {

    public static void syncStages(Id checklistId){

        Checklist__c checklist = [
            SELECT Id, Stage__c,
            Opportunity__c
            FROM Checklist__c
            WHERE Id = :checklistId
        ];

        Opportunity opp = new Opportunity(
            Id = checklist.Opportunity__c,
            StageName = checklist.Stage__c
        );

        update opp;

    }

}