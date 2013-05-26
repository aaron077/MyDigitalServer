package com.dengwm.server;


import java.util.ArrayList;
import java.util.List;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.DataListener;
import com.dengwm.bean.ChatObject;
import com.dengwm.bean.ClientInfoBean;;

public class ServerLauncher {

    public static void main(String[] args) throws InterruptedException {

        Configuration config = new Configuration();
        config.setHostname("localhost");
        config.setPort(9092);

        final SocketIOServer server = new SocketIOServer(config);

        server.addEventListener("qryinfoevent", ClientInfoBean.class, new DataListener<ClientInfoBean>() {
            public void onData(SocketIOClient client, ClientInfoBean data, AckRequest ackRequest) {
            	System.out.println("clientName"+data.getClientName());
            	System.out.println("company"+data.getCompany());
            	System.out.println("region"+data.getRegion());
            	List<ClientInfoBean> datas = new ArrayList<ClientInfoBean>();
            	datas.add(data);	
//            	data.setMessage("dwmtest");
//                server.getBroadcastOperations().sendEvent("chatevent", data);
//                data.setMessage("test");
            	System.out.println(datas.size());
            	
                client.sendEvent("qryinfoevent", datas);
            }
        });
        
        server.start();

        Thread.sleep(Integer.MAX_VALUE);

        server.stop();
    }

}
