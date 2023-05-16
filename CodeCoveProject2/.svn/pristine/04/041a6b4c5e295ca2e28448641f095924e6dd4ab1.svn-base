package kr.or.ddit.mapper.solutions;

import java.util.List;

import kr.or.ddit.expert.vo.ExpHeartVO;
import kr.or.ddit.expert.vo.ExpertProdVO;
import kr.or.ddit.expert.vo.MentoProfileVO;
import kr.or.ddit.expert.vo.MyExpertVO;
import kr.or.ddit.expert.vo.TemplateReviewVO;

public interface EprodMapper {



	public void templateInsert(ExpertProdVO expertProdVO) throws Exception;

	public ExpertProdVO templateDetail(String eprodNum);

	public void buyInsert(MyExpertVO myExpertVO);

	public int paySuccessInsert(MyExpertVO myExpertVO);

	public void buyUpdate(String myEprod);

	public MyExpertVO paySelect(String epayNum);


//	상품번호를 통해 결제 여부를 알아내는 쿼리 -->
//	<select id="download" parameterType="String" resultType="int">
	public int download(String eprodNum);

// 솔루션 멘토 프로필 뽑기
	public MentoProfileVO mentoProfile(String expertId);

//	상품 번호를 통해 찜하기가 몇개인지 알아내는 쿼리
	public int countHeart(String eprodNum);

//  상품 번호를 통해 별점 평균이 몇 점인지 알아내는 쿼리	
	public Float starAvg(String eprodNum);


//  상품 번호를 통해 리뷰가 몇 개인지 알아내는 쿼리	
	public int countReview(String eprodNum);
	



}
