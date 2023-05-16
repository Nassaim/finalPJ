package kr.or.ddit.admin.service.impl;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.admin.service.ExpertService;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mapper.admin.ExpertMapper;
import kr.or.ddit.member.vo.ExpertVO;

@Service
public class ExpertServiceImpl implements ExpertService {

	@Inject
	private ExpertMapper expMapper;
	
	@Override
	public int countExpList(PaginationInfoVO<ExpertVO> pagingVO) {
		return expMapper.countExpList(pagingVO);
	}

	@Override
	public List<ExpertVO> selectExpList(PaginationInfoVO<ExpertVO> pagingVO) {
		return expMapper.selectExpList(pagingVO);
	}
	
	@Override
	public ExpertVO selectExpform(String expFormNum) {
		return expMapper.selectExpform(expFormNum);
	}

	@Override
	public ServiceResult registerExpert(HttpServletRequest req, ExpertVO expertVO) {
		ServiceResult result = null;
		int status = expMapper.registerExpert(expertVO);
		int cnt = expMapper.modifyApplyCode(expertVO);
		
		if(status > 0 && cnt > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public ServiceResult refuseExpert(HttpServletRequest req, ExpertVO expertVO) {
		ServiceResult result = null;
		int status = expMapper.refuseExpert(expertVO);
		
		if(status > 0 ) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}


}
