package kr.or.ddit.admin.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.member.vo.ExpertVO;

public interface ExpertService {

	public int countExpList(PaginationInfoVO<ExpertVO> pagingVO);

	public List<ExpertVO> selectExpList(PaginationInfoVO<ExpertVO> pagingVO);
	
	public ExpertVO selectExpform(String expFormNum);

	public ServiceResult registerExpert(HttpServletRequest req, ExpertVO expertVO);

	public ServiceResult refuseExpert(HttpServletRequest req, ExpertVO expertVO);

	


}
