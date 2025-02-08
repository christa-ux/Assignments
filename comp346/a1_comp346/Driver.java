
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

public class Driver {


    public static void main(String[] args) {
    	
    	 /*******************************************************************************************************************************************
    	  * TODO : implement all the operations of main class   																					*
    	  ******************************************************************************************************************************************/

        Network objNetwork = new Network("network");  /* Activate the network */
        Thread networkThread = new Thread(objNetwork);
        networkThread.start();

        Server objServer = new Server();
        Thread serverThread = new Thread(objServer);
        serverThread.start();

        Client objClientSending = new Client("sending");
        Thread clientSendThread = new Thread(objClientSending);
        clientSendThread.start();

        Client objClientReceiving = new Client("receiving");
        Thread clientReceiveThread = new Thread(objClientReceiving);
        clientReceiveThread.start();
    }
}
