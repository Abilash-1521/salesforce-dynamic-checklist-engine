public with sharing class OpportunityTriggerHandler {

    public static void processConversion(List<Opportunity> opps){

        ChecklistService.createChecklist(opps);

    }

}