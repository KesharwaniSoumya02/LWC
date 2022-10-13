import { LightningElement , api} from 'lwc';
import getSObjects from '@salesforce/apex/GetSobject.getSObjects';
export default class ComboBoxController extends LightningElement {

    @api listOfObj ;
    @api value = 'nothing' ;
    @api objName;
    connectedCallback(){
        getSObjects({

        })
        .then(result =>{
            this.listOfObj = result ;
        })

        .catch(error =>{
            console.log('Error');
        })
    }

    ObjectSelect(event){
        this.value = event.detail.value ;

        getFields({objName : event.detail.value}).then(result =>{
            this.fieldsOptions = result ;
        })

        .catch(error =>{
            console.log('Error');
        });
    }
}