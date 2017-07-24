package com.cto.auction;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


@Controller("chatHandler")
public class ChatWebSocketHandler extends TextWebSocketHandler {
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	
	/*
	 * 클라이언트 연결 이후에 실행되는 메소드
	 * */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
		log("[+]"+session.getId()+" 접속");
		users.put(session.getId(), session);
	}
	
	
	/*
	 * 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
	 * */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub		
		super.handleTextMessage(session, message);
		log("[*]"+session.getId()+" 님: "+message.getPayload());
		for(WebSocketSession s:users.values()){
			s.sendMessage(message);
			log(s.getId()+" 님: "+message.getPayload());
		}
	}


	/*
	 * 클라이언트가 연결을 끊었을 때 실행되는 메소드
	 * */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		log("[-]"+session.getId()+" 접속 종료");
		users.remove(session.getId());
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
		log("[!]"+session.getId()+" 예외 발생: "+ exception.getMessage());
	}


	/*
	 * 임시 로그 처리
	 * */
	private void log(String logmsg){
		System.out.println(new Date()+" : "+logmsg);
	}
		
}
