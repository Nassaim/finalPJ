package kr.or.ddit.mapper.member;

import java.util.List;

import kr.or.ddit.expert.vo.MyExpertVO;
import kr.or.ddit.member.vo.MyChartVO;

public interface MyChartMapper {

	List<MyChartVO> selectYearProfie(MyChartVO chartVO);

	List<MyChartVO> selectCategoryProfit(MyChartVO chartVO);

	List<MyExpertVO> totalSellList(String memId);

	MyExpertVO selectTopResult(String expertId);

	MyExpertVO selectLastTopResult(String expertId);

	MyExpertVO selectTopLike(String expertId);

	MyExpertVO selectTopReview(String expertId);

}
