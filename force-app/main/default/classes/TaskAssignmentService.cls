public with sharing class TaskAssignmentService {

    public static void assignNextTask(Id checklistId){

        List<Task> tasks = [
            SELECT Id, Status
            FROM Task
            WHERE WhatId = :checklistId
            ORDER BY CreatedDate
        ];

        for(Task t : tasks){

            if(t.Status == 'New'){
                t.Status = 'Assigned';
                update t;
                break;
            }

        }

    }

}