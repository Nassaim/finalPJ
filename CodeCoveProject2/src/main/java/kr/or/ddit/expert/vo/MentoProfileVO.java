package kr.or.ddit.expert.vo;

import lombok.Data;

@Data
public class MentoProfileVO {
	
	private String expertId;	//멘토아이디
	private String presentation; //자기소개
	private String assume; //포트폴리오 주소
	private String expJobMajor;//전공
	private String expJobLevel;//직급
	private String expJobCurrent;//직업
	private String memName;//이름
	private String memNick;//닉네임
	private String memMail;//메일
	private String memProfile;//사진



}
