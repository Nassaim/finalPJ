package kr.or.ddit.admin.service.impl;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.or.ddit.admin.service.StatisticsService;
import kr.or.ddit.admin.vo.StatisticsVO;
import kr.or.ddit.mapper.admin.StatisticsMapper;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Inject
	public StatisticsMapper mapper;
	
	@Override
	public List<StatisticsVO> getYearCateData() {
		return mapper.getYearCateData();
	}

	@Override
	public List<StatisticsVO> getCateSumData() {
		return mapper.getCateSumData();
	}

	@Override
	public List<StatisticsVO> getCateData() {
		return mapper.getCateData();
	}

	@Override
	public List<StatisticsVO> getCateDataByCategories(String[] categories) {
		return mapper.getCateDataByCategories(categories);
	}

}
