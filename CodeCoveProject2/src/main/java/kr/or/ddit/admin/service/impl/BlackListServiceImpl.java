package kr.or.ddit.admin.service.impl;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.or.ddit.admin.service.BlackListService;
import kr.or.ddit.admin.vo.BlackListVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.common.ReportVO;
import kr.or.ddit.mapper.admin.BlackListMapper;

@Service
public class BlackListServiceImpl implements BlackListService {

	@Inject
	private BlackListMapper blackMapper;
	
	@Override
	public List<ReportVO> selectBlackList(PaginationInfoVO<ReportVO> pagingVO) {
		return blackMapper.selectBlackList(pagingVO);
	}

	@Override
	public BlackListVO getTotalReport() {
		return blackMapper.getTotalReport();
	}



}
