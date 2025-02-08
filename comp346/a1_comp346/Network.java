
public class Network implements Runnable {
    
    private static int maxNbPackets;                           /* Maximum number of simultaneous transactions handled by the network buffer */
    private static int inputIndexClient, inputIndexServer, outputIndexServer, outputIndexClient;                   /* Network buffer indices for accessing the input buffer (inputIndexClient, outputIndexServer) and output buffer (inputIndexServer, outputIndexClient) */
    private static String clientIP;                            /* IP number of the client application*/
    private static String serverIP;                            /* IP number of the server application */
    private static int portID;                                 /* Port ID of the client application */
    private static String clientConnectionStatus;              /* Client connection status - connected, disconnected, idle */
    private static String serverConnectionStatus;              /* Server connection status - connected, disconnected, idle */
    private static Transactions inComingPacket[];              /* Incoming network buffer */
    private static Transactions outGoingPacket[];              /* Outgoing network buffer */
    private static String inBufferStatus, outBufferStatus;     /* Current status of the network buffers - normal, full, empty */
    private static String networkStatus;                       /* Network status - active, inactive */
      

     Network(String context)
      { 
    	 int i;  
        
    	 /* Initialization of the network components */
        if (context.equals("network"))
          {
            System.out.println("\n Activating the network ...");
            clientIP = "192.168.2.0";
            serverIP = "216.120.40.10";
            clientConnectionStatus = "idle";
            serverConnectionStatus = "idle";
            portID = 0;
            maxNbPackets = 10;
            inComingPacket = new Transactions[maxNbPackets];
            outGoingPacket = new Transactions[maxNbPackets];
            for (i=0; i < maxNbPackets; i++)
            {   inComingPacket[i] = new Transactions();
                outGoingPacket[i] = new Transactions();
            }
            inBufferStatus = "empty";
            outBufferStatus = "empty";
            inputIndexClient = 0;
            inputIndexServer = 0;
            outputIndexServer = 0;
            outputIndexClient = 0;
            networkStatus = "active";
        }
        else /* Activate network components for client or server */
            System.out.println("\n Activating network components for " + context + "...");
      }     

     public String getClientIP()
     {
         return clientIP;
     }

     public void setClientIP(String cip)
     { 
         clientIP = cip;
     }

     public String getServerIP()
     {
         return serverIP;
     }
                          

     public void setServerIP(String sip)
     { 
         serverIP = sip;
     }

     public String getClientConnectionStatus()
     {
         return clientConnectionStatus;
     }
                          

     public void setClientConnectionStatus(String connectStatus)
     { 
         clientConnectionStatus = connectStatus;
     }

     public String getServerConnectionStatus()
     {
         return serverConnectionStatus;
     }

     public void setServerConnectionStatus(String connectStatus)
     { 
         serverConnectionStatus = connectStatus;
     } 
         

     public int getPortID()
     {
         return portID;
     }

     public void setPortID(int pid)
     { 
         portID = pid;
     }


     public String getInBufferStatus()
     {
         return inBufferStatus;
     }

     public void setInBufferStatus(String inBufStatus)
     { 
         inBufferStatus = inBufStatus;
     }

     public String getOutBufferStatus()
     {
         return outBufferStatus;
     }
         

     public void setOutBufferStatus(String outBufStatus)
     { 
         outBufferStatus = outBufStatus;
     }

     public String getNetworkStatus()
     {
         return networkStatus;
     }

     public void setNetworkStatus(String netStatus)
     { 
         networkStatus = netStatus;
     }
         

     public int getinputIndexClient()
     {
         return inputIndexClient;
     }
         

     public void setinputIndexClient(int i1)
     { 
         inputIndexClient = i1;
     }
         

     public int getinputIndexServer()
     {
         return inputIndexServer;
     }

     public void setinputIndexServer(int i2)
     { 
         inputIndexServer = i2;
     }     
         

     public int getoutputIndexServer()
     {
         return outputIndexServer;
     }

     public void setoutputIndexServer(int o1)
     { 
         outputIndexServer = o1;
     }
         

     public int getoutputIndexClient()
     {
         return outputIndexClient;
     }

     public void setoutputIndexClient(int o2)
     { 
         outputIndexClient = o2;
     }


	 public int getMaxNbPackets()
	 {
	     return maxNbPackets;
	 }

     public void setMaxNbPackets(int maxPackets)
     { 
         maxNbPackets = maxPackets;
     }

         public boolean send(Transactions inPacket)
        {
            inComingPacket[inputIndexClient].setAccountNumber(inPacket.getAccountNumber());
            inComingPacket[inputIndexClient].setOperationType(inPacket.getOperationType());
            inComingPacket[inputIndexClient].setTransactionAmount(inPacket.getTransactionAmount());
            inComingPacket[inputIndexClient].setTransactionBalance(inPacket.getTransactionBalance());
            inComingPacket[inputIndexClient].setTransactionError(inPacket.getTransactionError());
            inComingPacket[inputIndexClient].setTransactionStatus("transferred");
            
            System.out.println("\n DEBUG : Network.send() - index inputIndexClient " + inputIndexClient);
            System.out.println("\n DEBUG : Network.send() - account number " + inComingPacket[inputIndexClient].getAccountNumber());
            
            
            setinputIndexClient(((getinputIndexClient( ) + 1) % getMaxNbPackets ()));	/* Increment the input buffer index  for the client */
            /* Check if input buffer is full */
            if (getinputIndexClient() == getoutputIndexServer())
            {	
            	setInBufferStatus("full");
            
            	System.out.println("\n DEBUG : Network.send() - inComingBuffer status " + getInBufferStatus());
            }
            else
            	setInBufferStatus("normal");
            
            return true;
        }   
         

         public boolean receive(Transactions outPacket)
        {
            outPacket.setAccountNumber(outGoingPacket[outputIndexClient].getAccountNumber());
            outPacket.setOperationType(outGoingPacket[outputIndexClient].getOperationType());
            outPacket.setTransactionAmount(outGoingPacket[outputIndexClient].getTransactionAmount());
            outPacket.setTransactionBalance(outGoingPacket[outputIndexClient].getTransactionBalance());
            outPacket.setTransactionError(outGoingPacket[outputIndexClient].getTransactionError());
            outPacket.setTransactionStatus("done");
            
            System.out.println("\n DEBUG : Network.receive() - index outputIndexClient " + outputIndexClient);
            System.out.println("\n DEBUG : Network.receive() - account number " + outPacket.getAccountNumber());
            
            setoutputIndexClient(((getoutputIndexClient( ) + 1) % getMaxNbPackets( ))); /* Increment the output buffer index for the client */
            /* Check if output buffer is empty */
            if ( getoutputIndexClient( ) == getinputIndexServer( ))
            {	
            	setOutBufferStatus("empty");
            
            	System.out.println("\n DEBUG : Network.receive() - outGoingBuffer status " + getOutBufferStatus());
            }
            else
            	setOutBufferStatus("normal"); 
            
             return true;
        }   
    

         public boolean transferOut(Transactions outPacket)
        {
            outGoingPacket[inputIndexServer].setAccountNumber(outPacket.getAccountNumber());
            outGoingPacket[inputIndexServer].setOperationType(outPacket.getOperationType());
            outGoingPacket[inputIndexServer].setTransactionAmount(outPacket.getTransactionAmount());
            outGoingPacket[inputIndexServer].setTransactionBalance(outPacket.getTransactionBalance());
            outGoingPacket[inputIndexServer].setTransactionError(outPacket.getTransactionError());
            outGoingPacket[inputIndexServer].setTransactionStatus("transferred");
            
            System.out.println("\n DEBUG : Network.transferOut() - index inputIndexServer " + inputIndexServer);
            System.out.println("\n DEBUG : Network.transferOut() - account number " + outGoingPacket[inputIndexServer].getAccountNumber());
            
            setinputIndexServer(((getinputIndexServer() + 1) % getMaxNbPackets())); /* Increment the output buffer index for the server */
            /* Check if output buffer is full */
            if ( getinputIndexServer( ) == getoutputIndexClient( ))
            {
                setOutBufferStatus("full");
                
                System.out.println("\n DEBUG : Network.transferOut() - outGoingBuffer status " + getOutBufferStatus());
            }
            else
                setOutBufferStatus("normal");
            
             return true;
        }   
         

         public boolean transferIn(Transactions inPacket)
        {
		System.out.println("\n DEBUG : Network.transferIn - account number " + inComingPacket[outputIndexServer].getAccountNumber());
            inPacket.setAccountNumber(inComingPacket[outputIndexServer].getAccountNumber());
            inPacket.setOperationType(inComingPacket[outputIndexServer].getOperationType());
            inPacket.setTransactionAmount(inComingPacket[outputIndexServer].getTransactionAmount());
            inPacket.setTransactionBalance(inComingPacket[outputIndexServer].getTransactionBalance());
            inPacket.setTransactionError(inComingPacket[outputIndexServer].getTransactionError());
            inPacket.setTransactionStatus("received");
           
            System.out.println("\n DEBUG : Network.transferIn() - index outputIndexServer " + outputIndexServer);
            System.out.println("\n DEBUG : Network.transferIn() - account number " + inPacket.getAccountNumber());
            
           setoutputIndexServer(((getoutputIndexServer() + 1) % getMaxNbPackets()));	/* Increment the input buffer index for the server */
           /* Check if input buffer is empty */
            if ( getoutputIndexServer( ) == getinputIndexClient( ))
            {
                setInBufferStatus("empty");
                
                System.out.println("\n DEBUG : Network.transferIn() - inComingBuffer status " + getInBufferStatus());
            }
            else
                setInBufferStatus("normal");
            
             return true;
        }   
         

     public boolean connect(String IP)
     {
         if (getNetworkStatus().equals("active"))
         {
             if (getClientIP().equals(IP))
             {
                setClientConnectionStatus("connected");
                setPortID(0);
             }
             else
             if (getServerIP().equals(IP))
             {
                setServerConnectionStatus("connected");
             }
             return true;
         }
         else
             return false;
     }
     

     public boolean disconnect(String IP)
     {
          if (getNetworkStatus( ).equals("active"))
         {
             if (getClientIP().equals(IP))
             {
                setClientConnectionStatus("disconnected");
             }
             else
             if (getServerIP().equals(IP))
             {
                setServerConnectionStatus("disconnected");
             }
             return true;
         }
         else
             return false;
     }

	    public String toString() 
	    {
	        return ("\n Network status " + getNetworkStatus() + "Input buffer " + getInBufferStatus() + "Output buffer " + getOutBufferStatus());
	    }
    
     /***********************************************************************************************************************************************
      * TODO : implement the method Run() to execute the server thread				 																*
      * *********************************************************************************************************************************************/

     public void run()
     {
         System.out.println("\n DEBUG : Network.run() - starting network thread");

         while (true)
         {
             /* Implement here the code for the run method ... */

         }
     }
    }

