package kr.or.ddit.mapper.admin;

import java.util.List;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.member.vo.ExpertVO;

public interface ExpertMapper {
	
	public int countExpList(PaginationInfoVO<ExpertVO> pagingVO);

	public List<ExpertVO> selectExpList(PaginationInfoVO<ExpertVO> pagingVO);

	public ExpertVO selectExpform(String expFormNum);

	public int registerExpert(ExpertVO expertVO);

	public int modifyApplyCode(ExpertVO expertVO);

	public int refuseExpert(ExpertVO expertVO);


}
