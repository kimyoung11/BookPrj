package com.demo.controller.kyj;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

@Component
@ServerEndpoint("/websocket")
public class Websocket {

	/**
	 * 웹소켓 세션을 담는 ArrayList
	 */
	
	private static ArrayList<Session> clients = new ArrayList<Session>();
 
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        System.out.println(message);
        
        synchronized (clients) {
        	String sender = "";
        	for(int i=clients.size()-1;i>=0;i--) {
        		if(!clients.get(i).equals(session)) {
        			if(i==0) {
        				sender = "admin :";
        			}else {
        				sender = "user : ";
        			}
        			clients.get(i).getBasicRemote().sendText(sender + message);
        		}
        	}
        }
  	
    }

	@OnOpen
	public void onOpen(Session session) {
		System.out.println(session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
}
