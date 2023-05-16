package kr.or.ddit.common.chat.vo;


import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ChatVO {
	private String crContentNum; // 채팅방 순서 
	private String crNum;		 // 채팅방 번호
	private String crContent; 	 // 일반 메세지
	private Date crDate;		 // 등록일
	private String crFile;		 // 첨부파일
	private String memId;		 // 송신자
	
	MultipartFile file;			// 파일받는용도
	
	// chatRoom
	private Date crCreateDate;	// 채팅방 개설일
	private String crId;		// 채팅방 구분ID

	
	// 프로젝트용 채팅
	private String pjId;		// 프로젝트 아이디
	private String pjName; 		// 프로젝트명
	private Date pjCreateDate;	// 프로젝트 생성일
	private String comCodeNm;	// 공통코드명
	private String memNick; 	// 멤버닉네임
	
	
}
