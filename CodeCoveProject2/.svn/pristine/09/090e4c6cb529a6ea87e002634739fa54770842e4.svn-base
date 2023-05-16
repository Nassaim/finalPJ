package kr.or.ddit.board.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.project.project.vo.ProjectVO;
import lombok.Data;

@Data
public class CooBoardVO {
	private String cooNm;			//협업번호
	private String writerId;        //회원아이디
	private String pjId;            //프로젝트아이디
	private String cooTitle;        //글제목
	private String cooContent;      //글내용
	private String cooPeopleNum;    //협업 수용 최대 인원
	private String cooStartDate;    //시작일
	private String cooEndDate;      //종료일
	private String cooDoneYn;       //프로젝트종료여부
	private int repNum;          //신고횟수
	private int viewNum;         //조회수
	private String cooDate;         //게시글 작성일자
	private String cooThumbnail;    //썸네일 이미지
	private List<AttatchVO> attatchList;
	private String attatchNum;
	private String memNick;		//회원별명
	private int memCount;		//회원수
	
	
	private Integer[] delCoBoNo;
	
	private List<String> postNumList;
	private List<AttatchVO> attatchNums;
	
	private String pjName; 	//프로젝트 명
	
	private List<ProjectVO> pjList;	//ProjectVO 리스트
	
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
