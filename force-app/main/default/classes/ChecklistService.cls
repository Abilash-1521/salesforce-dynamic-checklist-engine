public with sharing class ChecklistService {

    public static void handleOpportunityConversion(
        List<Opportunity> newList,
        Map<Id,Opportunity> oldMap){

        List<Opportunity> convertedOpps = new List<Opportunity>();

        for(Opportunity opp : newList){

            if(opp.StageName == 'Converted' &&
               oldMap.get(opp.Id).StageName != 'Converted'){

                convertedOpps.add(opp);

            }

        }

        if(!convertedOpps.isEmpty()){
            createChecklist(convertedOpps);
        }

    }

    public static void createChecklist(List<Opportunity> opps){

        List<Checklist__c> checklists = new List<Checklist__c>();

        for(Opportunity opp : opps){

            Checklist__c c = new Checklist__c();
            c.Opportunity__c = opp.Id;
            c.Stage__c = 'New';

            checklists.add(c);

        }

        insert checklists;

    }

}