package kr.or.ddit.admin.service;

import java.util.List;
import kr.or.ddit.admin.vo.BlackListVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.common.ReportVO;

public interface BlackListService {

	public List<ReportVO> selectBlackList(PaginationInfoVO<ReportVO> pagingVO);

	public BlackListVO getTotalReport();

}
