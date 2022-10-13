public class Practice1 {
    public static void hey(){
        List<Account> accList = new List<Account>();
        
        for(integer i=0 ; i<5 ; i++){
            Account a=new Account(Name = 'Soumya '+i);
            accList.add(a);
        }
        insert accList ;
    }
}