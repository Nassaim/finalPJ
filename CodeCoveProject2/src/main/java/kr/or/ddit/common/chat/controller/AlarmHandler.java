package kr.or.ddit.common.chat.controller;


import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/coco/project")
public class AlarmHandler extends TextWebSocketHandler {
	/*
	 * 웹소켓 : 클라이언트의 요청 없이 데이터를 주고 받는 것-
	 * 즉 기존(http:클라이언트요청방식) -----Handshake-----> WS(WebSocket)프로토콜로 전환
	 */
	
	
	//웹소켓---------------------------------------------------------------------------------

	// 세션 리스트
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	// 세션 맵
	HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	
	
	// 클라이언트 연결시 실행
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("{} 연결됨", session.getId());
		
		super.afterConnectionEstablished(session);
		sessionMap.put(session.getId(), session);
		
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toJSONString()));
	}
	

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        
        
        //모든 유저에게 메세지 출력
        String msg = message.getPayload();
		JSONObject obj = jsonToObjectParser(msg);
		
		for(String key : sessionMap.keySet()) { // 키를 꺼내서 저장하고
			WebSocketSession sess = sessionMap.get(key); // sessionId에 해당하는 session 꺼냄
			try {
				sess.sendMessage(new TextMessage(obj.toJSONString())); //  Json으로 변환된 메세지 전송
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
    }
    
    // 클라이언트가 연결 끊었을 때 
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	log.info("{} 연결 끊김", session.getId());
    	sessionMap.remove(session.getId());
    	super.afterConnectionClosed(session, status);
    }
    
    
//    @Override
//    public void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
//    	
//    }
    
    
    private static JSONObject jsonToObjectParser(String jsonStr) {
    	JSONParser parser = new JSONParser();
    	JSONObject obj = null;
    	try {
    		obj = (JSONObject) parser.parse(jsonStr);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return obj;
    }
	
}

