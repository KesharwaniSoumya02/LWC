trigger TestBeforeTrigger on Account (before insert) {
	
    for(Account acc : Trigger.New)

    {

     List<Account> mynew = [SELECT Id, Name FROM Account WHERE Name =: acc.Name];

     if(mynew.size() > 0)

     {

      acc.Name.addError('Account with same name is existing');

     } 

    }
}