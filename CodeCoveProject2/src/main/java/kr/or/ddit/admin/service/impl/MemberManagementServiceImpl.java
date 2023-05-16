package kr.or.ddit.admin.service.impl;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.or.ddit.admin.service.MemberManagementService;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mapper.admin.MemberManagementMapper;
import kr.or.ddit.member.vo.MemberVO;

@Service
public class MemberManagementServiceImpl implements MemberManagementService {

	@Inject
	private MemberManagementMapper memberMapper;
	
	@Override
	public List<MemberVO> selectAllMemberList(PaginationInfoVO<MemberVO> pagingVO) {
		return memberMapper.selectAllMemberList(pagingVO);
	}

}
