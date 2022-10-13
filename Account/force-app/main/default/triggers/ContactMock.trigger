trigger ContactMock on Contact (before insert) {
    Account acc = [Select id From Account limit 1];
    for(Contact con : trigger.New){
        if(con.AccountId ==''){
            con.AccountId = acc.Id;
        }
    }
}