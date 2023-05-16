package kr.or.ddit.expert.service;

import java.util.List;

import kr.or.ddit.expert.vo.ExpHeartVO;
import kr.or.ddit.expert.vo.ExpertProdVO;
import kr.or.ddit.expert.vo.MentoProfileVO;
import kr.or.ddit.expert.vo.MyExpertVO;
import kr.or.ddit.expert.vo.TemplateReviewVO;

public interface IEprodService {

	//템플릿 판매용 인서트 프로세스
	public void templateInsert(ExpertProdVO expertProdVO) throws Exception;

	//템플릿 디테일 출력(셀렉트)
	public ExpertProdVO templateDetail(String eprodNum);

	//디테일에서 구매하기작동 시 아작스로 구매내역 인서트
	public void buyInsert(MyExpertVO myExpertVO);

	//구매완료 후 1.인서트
	public MyExpertVO paySuccessInsert(MyExpertVO myExpertVO);

	//멘토 프로필 출력용
	public MentoProfileVO mentoProfile(String expertId);




	




	

	



}
