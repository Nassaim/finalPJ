package kr.or.ddit.mapper.admin;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.member.vo.MemberVO;

@Mapper
public interface MemberManagementMapper {

	/**
	 * 관리자 계정인지 확인
	 * 
	 * @param memId 확인할 아이디
	 * @return
	 */
	public int checkAdmin(String memId);

	public List<MemberVO> selectAllMemberList(PaginationInfoVO<MemberVO> pagingVO);

}
