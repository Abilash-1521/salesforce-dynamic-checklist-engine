import { LightningElement, wire } from 'lwc';
import getChecklists from '@salesforce/apex/ChecklistService.getChecklists';

export default class ChecklistDashboard extends LightningElement {

    checklists;

    @wire(getChecklists)
    wiredChecklists({data,error}){

        if(data){
            this.checklists=data;
        }

    }

}