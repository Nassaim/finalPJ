package kr.or.ddit.board.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.AttatchVO;
import lombok.Data;

@Data
public class FreeBoardVO {
	private String freeNum;		//자유게시판 번호
	private String writerId;	//작성자아이디 
	private String freeTitle; 	//자유게시판 제목
	private String freeContent; //자유게시판 내용
	private String freeDate; 	//작성일자
	private String repNum;		//누적신고수
	private String viewNum;		//누적조회수
	private String memName;		//회원명
	private String memMail;		//회원이메일
	private String memProfile;	//회원 프로필 이미지
	private List<AttatchVO> attatchList;
	private String attatchNum;
	private String memNick;
	
	private List<String> postNumList;
	private List<AttatchVO> attatchNums;
	
	private MultipartFile[] postFiles;

	public void setPostFiles(MultipartFile[] postFiles) {
		if (postFiles == null || postFiles.length == 0)
			return;
		this.postFiles = postFiles;
		this.attatchList = new ArrayList<>();
		for (MultipartFile single : postFiles) {
			if (single.isEmpty())
				continue;
			attatchList.add(new AttatchVO(single));
		}
	}


	private Object jsonContents;
}
