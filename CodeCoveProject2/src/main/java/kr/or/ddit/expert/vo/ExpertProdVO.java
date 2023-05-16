package kr.or.ddit.expert.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.AttatchVO;
import lombok.Data;

@Data
public class ExpertProdVO {

	private String eprodNum;		//상품번호
	private String eprodCateNum;	//템플릿1, 멘토링2
	private String expertId;		//멘토아이디 판매자
	private String eprodName;		//상품명
	private String eprodTag;		//상품카테고리
	private int eprodPrice; 		//상품가격
	private Date eprodDate;		//상품등록일자
	private int accumNum;		//신고횟수
	private String eprodLangCode;	//상품언어코드
	private String eprodSummary;	//상품설명
	private String eprodDel;		//삭제여부
	private int eprodHeart;		//상품하트
	private String eprodThumbnail;	//상품썸네일
	private String attatchNum;
	private String memId;	//멤버아이디 첨부파일용
	private int downloadYn; //상품번호를 통해 결재 여부를 알아내는 쿼리
	private String memNick;	//멤버닉네임
	private int isHeart;
	private int countHeart;//게시글의 총 하트 갯수
	private Float starAvg; //별점 평균
	private int countReview;//리뷰갯수

//	private int reviewCount;//리뷰갯수(리스트) 
//	private Float reviewStarAvg;// 별점 평균(리스트)
	
	

//파일추가 메소드 	
	private MultipartFile[] postFiles;

	
	//판매 템플릿 파일을 추가하는 메소드
	private MultipartFile[] postFiles2;
	
	public void setPostFiles2(MultipartFile[] postFiles2) {
		if (postFiles2 == null || postFiles2.length == 0)
			return;
		this.postFiles2 = postFiles2;
		this.attatchList = new ArrayList<>();
		for (MultipartFile single : postFiles2) {
			if (single.isEmpty())
				continue;
			attatchList.add(new AttatchVO(single));
		}
	}

	
	
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
	

	private transient List<AttatchVO> attatchList;


	
	

//	private List<String> postNumList;
//	private List<AttatchVO> attatchNums;
//
//	private Object jsonContents;	
	
	
	
	
}
