

public class Transactions {
    
    private String accountNumber;       /* Account number */
    private String operationType;       /* Operation type : deposit, withdrawal, query */
    private double transactionAmount;   /* Amount to deposit or withdraw */
    private double transactionBalance;  /* Account balance after transaction */
    private String transactionError;    /* Transaction error : NSF, invalid amount, invalind account, none */
    private String transactionStatus;   /* Current transaction status : pending, sent, received, transferred, done */
    

    Transactions()
    {
        accountNumber = " ";
        operationType = " ";
        transactionAmount = 0.00;
        transactionBalance = 0.00;
        transactionError = "none";
        transactionStatus = " ";
    }

     public String getAccountNumber()
     {
         return accountNumber;
     }

     public void setAccountNumber(String accNumber)
     { 
         accountNumber = accNumber;
     }
     

     public String getOperationType()
     {
         return operationType;
     }
         

     public void setOperationType(String opType)
     { 
         operationType = opType;
     }
     

     public double getTransactionAmount()
     {
         return transactionAmount;
     }

     public void setTransactionAmount(double transAmount)
     { 
         transactionAmount = transAmount;
     }
     

     public double getTransactionBalance()
     {
         return transactionBalance;
     }

     public void setTransactionBalance(double transBalance)
     { 
         transactionBalance = transBalance;
     }

     public String getTransactionError()
     {
         return transactionError;
     }
     

     public void setTransactionError(String transError)
     { 
         transactionError = transError;
     }
     

     public String getTransactionStatus()
     {
         return transactionStatus;
     }

     public void setTransactionStatus(String transStatus)
     { 
         transactionError = transStatus;
     }

    public String toString() 
    {
    	return ("\n Account number " + getAccountNumber() + " Account Balance " + getTransactionBalance() + " Message " + getTransactionError());
    }

}

