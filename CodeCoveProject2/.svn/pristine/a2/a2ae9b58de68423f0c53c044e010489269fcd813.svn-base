package kr.or.ddit.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.expert.vo.MyExpertVO;
import kr.or.ddit.mapper.member.MyChartMapper;
import kr.or.ddit.member.vo.MyChartVO;

@Service
public class MemberChartImpl implements IMemberChart {

	@Inject
	private MyChartMapper chartMapper;
	
	@Override
	public List<MyChartVO> selectYearProfie(MyChartVO chartVO) {
		return chartMapper.selectYearProfie(chartVO);
	}

	@Override
	public List<MyChartVO> selectCategoryProfit(MyChartVO chartVO) {
		return chartMapper.selectCategoryProfit(chartVO);
	}

	@Override
	public List<MyExpertVO> totalSellList(String expertId) {
		return chartMapper.totalSellList(expertId);
	}

	@Override
	public MyExpertVO selectTopResult(String expertId) {
		return chartMapper.selectTopResult(expertId);
	}

	@Override
	public MyExpertVO selectLastTopResult(String expertId) {
		return chartMapper.selectLastTopResult(expertId);
	}

	@Override
	public MyExpertVO selectTopLike(String expertId) {
		return chartMapper.selectTopLike(expertId);
	}

	@Override
	public MyExpertVO selectTopReview(String expertId) {
		return chartMapper.selectTopReview(expertId);
	}

}
