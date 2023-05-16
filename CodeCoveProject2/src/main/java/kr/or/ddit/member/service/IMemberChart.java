package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.expert.vo.MyExpertVO;
import kr.or.ddit.member.vo.MyChartVO;

public interface IMemberChart {

	List<MyChartVO> selectYearProfie(MyChartVO chartVO);

	List<MyChartVO> selectCategoryProfit(MyChartVO chartVO);

	List<MyExpertVO> totalSellList(String expertId);

	MyExpertVO selectTopResult(String expertId);

	MyExpertVO selectLastTopResult(String expertId);

	MyExpertVO selectTopLike(String expertId);

	MyExpertVO selectTopReview(String expertId);

}
