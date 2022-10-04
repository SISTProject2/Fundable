package com.sist.chat;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/site/chat/chat-ws")
public class ChatServer {
//	private Set<Session> users=Collections.synchronizedSet(new HashSet<Session>());
	private static List<Session> users=new ArrayList<Session>();
	// 접속자의 중복을 허용하지 않는다 => 저장시 동기화
	
	@OnOpen
	public void onOpen(Session session) {
		users.add(session);
	}
	
	@OnClose
	public void onClose(Session session) {
		users.remove(session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws Exception {
		// 쓰레드 동기화
		synchronized (users) {
			for(Session s:users) {
				s.getBasicRemote().sendText(message);
			}
		}
	}
	
}
