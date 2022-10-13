import { LightningElement, api,track } from 'lwc';
import getObjects from '@salesforce/apex/ObjectController.getObjects';
import getAllFields from '@salesforce/apex/ObjectController.getAllFields';
import getDb from '@salesforce/apex/ObjectController.getDb';
export default class ObjectDropDown extends LightningElement {
    value ='';
    @api options ;
    @api fieldOptions ;
    @api Selected ;
    @track container = [];
    @api objectName ;
    @api queryi ;
    @track columns = [];
    @track tableData ;
    connectedCallback(){
        getObjects({

        })
        .then(result=>{
            this.options = result;
            
        })
        .catch(error=>{
            console.log('Error');
        });

    }
    
    handledChange(event){
       this.value = event.detail.value;
        
        getAllFields({objectName : event.detail.value}).then(result=>{
            this.fieldOptions = result ;
        
        }).catch(error=>{
            console.log('Error')
        });
    }

    changeMethod(event){
        this.container = event.detail.value ;
        this.queryi = 'Select ' + this.container + ' from ' +  this.value;
    }

    showTable(event){
        
        getDb({queryi : this.queryi})
        .then(result =>{
            this.tableData = result ;
            var s = [];
            for(var i=0; i<this.container.length;i++){
                
                s.push({
                    label : this.container[i],
                    fieldName : this.container[i],
                })
            }
            this.columns = s;
        }).catch(error =>{
            console.log('Error');
        })
    }
}
    
    