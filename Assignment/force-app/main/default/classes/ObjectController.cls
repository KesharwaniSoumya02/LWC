public with sharing class ObjectController {
    
    @AuraEnabled
    public static List<labelWrapper> getObjects(){
        
        
        List<schema.SObjectType> st = Schema.getGlobalDescribe().Values();
        List<labelWrapper> wrapperList = new List<labelWrapper>();
        
        for(SObjectType sot: st){
            labelWrapper t = new labelWrapper();
            t.label =  sot.getDescribe().getLabel();
            t.value = sot.getDescribe().getName();
            wrapperList.add(t);
        }
        
        return wrapperList;
    }
    @AuraEnabled
    public static List<labelWrapper> getAllFields(String objectName){

        List<labelWrapper> listField = new List<labelWrapper>();

        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Schema.SObjectType sobjType = gd.get(objectName);
        Schema.DescribeSObjectResult r = sobjType.getDescribe();
        Map<String, Schema.SObjectField> MapofField = r.fields.getMap();

        for(String st : MapofField.Keyset()){
            labelWrapper fw = new labelWrapper();
            fw.label = MapofField.get(st).getDescribe().getlabel();
            fw.value = MapofField.get(st).getDescribe().getName();
            listField.add(fw);
        }
        return listField ;
    }
    @AuraEnabled
    public static List<sObject> getDb(String queryi){
        return Database.query(queryi);
    }

    public class labelWrapper{
        @auraEnabled
        public String label;
        @auraEnabled
        public String value;
    }
}