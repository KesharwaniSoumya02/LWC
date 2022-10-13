public with sharing class SOBject {
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

}
