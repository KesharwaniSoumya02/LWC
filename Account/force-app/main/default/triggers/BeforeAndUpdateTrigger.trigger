trigger BeforeAndUpdateTrigger on Contact (before insert) {
	Map<String,Contact> NameMap =new Map<String,Contact>(); 
    for(Contact conNew : Trigger.New){
        NameMap.put(conNew.LastName, conNew);
    }
     List<Contact> listOFCon =[Select LastName from Contact where LastName IN: NameMap.keySet()];
     
    for(contact con: listOFCon){        
		contact existingCont = NameMap.get(con.lastName);
        if(existingCont!= null){
        	existingCont.LastName.addError('Contact With The Same Name Exist');
        }
    }
    for(Contact conNew : Trigger.New){
    	conNew.lastName = 'asdaf';
    }
    
    for(Contact con : Trigger.New){
        integer dateBetween = con.Birthdate.daysBetween(system.today());
        integer n=(integer)(dateBetween/365);
        if(n<18){
            con.Birthdate.addError('Age is Beloqw 18');
        }
    }
}