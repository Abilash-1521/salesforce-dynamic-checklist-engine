trigger OpportunityTrigger on Opportunity (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){

        ChecklistService.handleOpportunityConversion(Trigger.new, Trigger.oldMap);

    }

}