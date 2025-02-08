
import java.util.Scanner;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.InputMismatchException;


public class Client implements Runnable {

    private static int numberOfTransactions;   		/* Number of transactions to process */
    private static int maxNbTransactions;      		/* Maximum number of transactions */
    private static Transactions [] transaction; 	/* Transactions to be processed */
    private static Network objNetwork;          	/* Client object to handle network operations */
    private String clientOperation;    				/* sending or receiving */

     Client(String operation)
     {
       if (operation.equals("sending"))
       {
           System.out.println("\n Initializing client sending application ...");
           numberOfTransactions = 0;
           maxNbTransactions = 100;
           transaction = new Transactions[maxNbTransactions];
           objNetwork = new Network("client");
           clientOperation = operation;
           System.out.println("\n Initializing the transactions ... ");
           readTransactions();
           System.out.println("\n Connecting client to network ...");
           String cip = objNetwork.getClientIP();
           if (!(objNetwork.connect(cip)))
           {   System.out.println("\n Terminating client application, network unavailable");
               System.exit(0);
           }
       	}
       else
    	   if (operation.equals("receiving"))
           {
    		   System.out.println("\n Initializing client receiving application ...");
    		   clientOperation = operation;
           }
     }


     public int getNumberOfTransactions()
     {
         return numberOfTransactions;
     }

     public void setNumberOfTransactions(int nbOfTrans)
     {
         numberOfTransactions = nbOfTrans;
     }

     public String getClientOperation()
     {
         return clientOperation;
     }

	 public void setClientOperation(String operation)
	 {
	     clientOperation = operation;
	 }


     public void readTransactions()
     {
        Scanner inputStream = null;     /* Transactions input file stream */
        int i = 0;                      /* Index of transactions array */

        try
        {
        	inputStream = new Scanner(new FileInputStream("transaction.txt"));
        }
        catch(FileNotFoundException e)
        {
            System.out.println("File transaction.txt was not found");
            System.out.println("or could not be opened.");
            System.exit(0);
        }
        while (inputStream.hasNextLine( ))
        {
            try
            {   transaction[i] = new Transactions();
                transaction[i].setAccountNumber(inputStream.next());            /* Read account number */
                transaction[i].setOperationType(inputStream.next());            /* Read transaction type */
                transaction[i].setTransactionAmount(inputStream.nextDouble());  /* Read transaction amount */
                transaction[i].setTransactionStatus("pending");                 /* Set current transaction status */
                i++;
            }
             catch(InputMismatchException e)
            {
                System.out.println("Line " + i + "file transactions.txt invalid input");
                System.exit(0);
            }

        }
        setNumberOfTransactions(i);		/* Record the number of transactions processed */

        System.out.println("\n DEBUG : Client.readTransactions() - " + getNumberOfTransactions() + " transactions processed");

        inputStream.close( );

     }


     public void sendTransactions()
     {
         int i = 0;     /* index of transaction array */

         while (i < getNumberOfTransactions())
         {
            // while( objNetwork.getInBufferStatus().equals("full") );     /* Alternatively, busy-wait until the network input buffer is available */

            transaction[i].setTransactionStatus("sent");   /* Set current transaction status */

            System.out.println("\n DEBUG : Client.sendTransactions() - sending transaction on account " + transaction[i].getAccountNumber());

            objNetwork.send(transaction[i]);                            /* Transmit current transaction */
            i++;
         }

    }

     public void receiveTransactions(Transactions transact)
     {
         int i = 0;     /* Index of transaction array */

         while (i < getNumberOfTransactions())
         {
        	 // while( objNetwork.getOutBufferStatus().equals("empty"));  	/* Alternatively, busy-wait until the network output buffer is available */

            objNetwork.receive(transact);                               	/* Receive updated transaction from the network buffer */

            System.out.println("\n DEBUG : Client.receiveTransactions() - receiving updated transaction on account " + transact.getAccountNumber());

            System.out.println(transact);                               	/* Display updated transaction */
            i++;
         }
    }

     public String toString()
     {
    	 return ("\n client IP " + objNetwork.getClientIP() + " Connection status" + objNetwork.getClientConnectionStatus() + "Number of transactions " + getNumberOfTransactions());
     }


    public void run()
    {
        Transactions transact = new Transactions();
        long sendClientStartTime, sendClientEndTime, receiveClientStartTime, receiveClientEndTime;

        /* Implement here the code for the run method ... */
        if (clientOperation.equals("sending")) {
            sendClientStartTime = System.currentTimeMillis();

            System.out.println("\n DEBUG : Client.run() - starting client thread for sending");

            sendTransactions();

            sendClientEndTime = System.currentTimeMillis();
            System.out.println("\n Terminating client thread - Running time " + (sendClientEndTime - sendClientStartTime) + " milliseconds");
        } else if (clientOperation.equals("receiving")) {
            receiveClientStartTime = System.currentTimeMillis();

            System.out.println("\n DEBUG : Client.run() - starting client thread for receiving");

            receiveTransactions(transact);

            receiveClientEndTime = System.currentTimeMillis();
            System.out.println("\n Terminating client thread - Running time " + (receiveClientEndTime - receiveClientStartTime) + " milliseconds");
        }
    }
}
