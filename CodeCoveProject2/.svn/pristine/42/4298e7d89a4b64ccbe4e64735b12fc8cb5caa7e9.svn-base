package kr.or.ddit.board.vo;

import java.util.List;

import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class BoReplyVO {
	private Integer rnum;
	private String boReplyNum;	//댓글번호
	private String freeNum;		//자유게시판 번호
	private String writerId;	//작성자 아이디
	private String boReplyWriter;	//게시판 번호
	private String boReplyTarget;	//게시판 번호
	
	@Size(min=1, max=150)
	private String boReplyContent;	//댓글내용
	private String boReplyDate;		//작성일
	private String parentBoReplyNum; //상위댓글 번호
	
	private String freeTitle;		//자유게시판 제목
	private List<String> boReplyNumList;//게시판 댓글 리스트?

}
