public with sharing class DatabaseController {

    @AuraEnabled
    public static List<ObjectWrapper> getObjects(){

        List<ObjectWrapper> objWrap = new List<ObjectWrapper>();
        List<Schema.SObjectType> st = Schema.getGlobalDescribe().Values();
        for(SObjectType count : st){
            ObjectWrapper obj = new ObjectWrapper();
            obj.label = count.getDescribe().getLabel();
            obj.value = count.getDescribe().getLabel();
            objWrap.add(obj);
        }

        return objWrap ;
    }

    @AuraEnabled
    public static List<ObjectWrapper> getFields(String selectedObject){

        List<ObjectWrapper> listField =new List<ObjectWrapper>();

        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe();     
        Schema.SObjectType sobjType = gd.get(selectedObject);
        Schema.DescribeSObjectResult r = sobjType.getDescribe();
        Map<String, Schema.SObjectField> MapofField = r.fields.getMap();

        for(String st : MapofField.Keyset()){
            ObjectWrapper fw = new ObjectWrapper();
            fw.label = MapofField.get(st).getDescribe().getlabel();
            fw.value = MapofField.get(st).getDescribe().getName();
            listField.add(fw);
        } 
        return listField ;
    }

    public class ObjectWrapper{
        @AuraEnabled
        public String label;
        @AuraEnabled
        public String value;
    }
}
