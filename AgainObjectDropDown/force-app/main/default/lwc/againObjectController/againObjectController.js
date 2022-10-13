import { LightningElement , api} from 'lwc';
import getObjects from '@salesforce/apex/DatabaseController.getObjects';
import getFields from '@salesforce/apex/getFields.getFields';
export default class AgainObjectController extends LightningElement {
   
    @api objectOptions ;
    @api selectedObject ;
    @api fieldOptions ;
    connectedCallback(){
        getObjects({

        }).then(result =>{
            this.objectOptions = result ;
        }).catch(error =>{
            console.log('Error');
        });
    }

    objectChange(event){
        this.selectedObject = event.detail.value;
        getFields({objectOptions : event.detail.value}).then(result =>{
            this.fieldOptions = result ;
        }).catch(error =>{
            console.log('Error');
        })

    }
}