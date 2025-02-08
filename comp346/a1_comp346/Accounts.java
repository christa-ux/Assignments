
public class Accounts {
    
    private String accountNumber;       /* Unique account number */
    private String accountType;         /* chequing, saving, credit */
    private String firstName;           /* First name of account holder */
    private String lastName;            /* Last name of account holder */
    private double balance;             /* Account balance */
     

    Accounts()
    {
        accountNumber = " ";
        accountType = " ";
        firstName = " ";
        lastName = " ";
        balance = 0.0;
    }
    

     public String getAccountNumber()
     {
         return accountNumber;
     }

     public void setAccountNumber(String accNumber)
     { 
         accountNumber = accNumber;
     }  

     public String getAccountType()
     {
         return accountType;
     }
         

     public void setAccountType(String accType)
     { 
         accountType = accType;
     }  

     public String getFirstName()
     {
         return firstName;
     }
         

     public void setFirstName(String fName)
     { 
         firstName = fName;
     }  
        

     public String getLastName()
     {
         return lastName;
     }

     public void setLastName(String lName)
     { 
         lastName = lName;
     }           

     public double getBalance()
     {
         return balance;
     }
         

     public void setBalance(double bal)
     { 
         balance = bal;
     }           
         

	public String toString() 
	{
		return ("\n Account number " + getAccountNumber() + "Account type " + getAccountType() + "First name " + getFirstName() + "Last Name " + getLastName() + "Balance " + getBalance());
	}
    
}
