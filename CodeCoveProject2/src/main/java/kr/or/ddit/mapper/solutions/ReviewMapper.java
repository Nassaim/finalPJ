package kr.or.ddit.mapper.solutions;

import java.util.List;

import kr.or.ddit.common.ReportVO;
import kr.or.ddit.expert.vo.ExpHeartVO;
import kr.or.ddit.expert.vo.ExpertProdVO;
import kr.or.ddit.expert.vo.TemplateReviewVO;

public interface ReviewMapper {

	public void templateReviewInsert(TemplateReviewVO templateReviewVO);

	public List<TemplateReviewVO> templateReviewList(String eprodNum);

	public void templateHeartInsert(ExpHeartVO expHeartVO);

	public void templateHeartDelete(ExpHeartVO expHeartVO);

	public int isHeart(ExpHeartVO expHeartVO);

	public int isReview(TemplateReviewVO templateReviewVO);

	public void reportInsert(ReportVO reportVO);

	public int isReport(ReportVO reportVO);

	//	상품 번호를 통해 별점 평균이 몇 점인지 아작스로 화면출력 쿼리 
	public float starAvgAjax(ExpertProdVO expertProdVO);

	//	상품 번호를 통해 총 댓글이 몇 개인지 아작스로 화면 출력 
	public int countReview(TemplateReviewVO templateReviewVO);


	

	


}
