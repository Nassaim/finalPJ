package kr.or.ddit.expert.vo;

import java.util.Date;

import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class TemplateReviewVO {

	private String reviewNum;	//리뷰번호-primaryKey
	private String eprodNum;		//상품번호-foreignKey with exp_prod
	private String reviewTitle;//리뷰제목
	@Size(min =1, max=150)
	private String reviewContent;//리뷰내용
	private int reviewStar;		//별점
	private String reviewWriter;//리뷰작성자
	private String reviewDate;	//리뷰날짜
	private String rNum; //역순 지정용 
	private int reviewCheck;//리뷰썼는지 체크
	private int countReview; //리뷰 총 갯수
	private String memProfile;//멤버 사진
	
	
}
