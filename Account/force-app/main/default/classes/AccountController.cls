public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){

        return [Select Name, Annualrevenue, Industry from Account with security_Enforced order by Name];

    }
}
