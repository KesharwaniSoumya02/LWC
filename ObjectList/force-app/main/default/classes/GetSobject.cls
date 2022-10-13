public with sharing class GetSobject {
    @AuraEnabled
     
    public static List<SObjectWrapper> getSObjects() {

        List<Schema.SObjectType> sot = Schema.getGlobalDescribe().Values();

        List<SObjectWrapper> sObjectList = new List<SObjectWrapper>();

        for(SObjectType count : sot){
            SObjectWrapper obj = new SObjectWrapper();

            obj.label = count.getdescribe().getLabel();
            
            obj.value = count.getDescribe().getName();

            sObjectList.add(obj);
        }
		System.debug(sObjectList);
        return sObjectList ;

    }

    public class SObjectWrapper{

        @AuraEnabled
        public String label;

        @AuraEnabled
        public String value;
    }

    @AuraEnabled
    public static List<> getFields(String objName){
        List<SObjectWrapper> listOfField = new List<SObjectWrapper>();

        Map<String,Schema.SObjectType> mapOfObjnmFields = new Map<String,Schema.SObjectType>();
        Schema.SObjectType getSelectedObj =  mapOfObjnmFields.get(objName);
        Schema.DescribeSObjectResult r = getSelectedObj.getDescribe();
        Map<String, Schema.SObjectField> MapOfField = r.fields.getmap();
    }
}
