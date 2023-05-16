package kr.or.ddit.admin.service.impl;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.admin.service.ComcodeService;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mapper.admin.ComcodeMapper;

@Service
public class ComcodeServiceImpl implements ComcodeService {

	@Inject
	private ComcodeMapper comcodeMapper;

	@Override
	public List<ComCodeVO> selectCodeList() {
		return comcodeMapper.selectCodeList();
	}

	@Override
	public ComCodeVO selectCode(String comCode) {
		return comcodeMapper.selectCode(comCode);
	}

	@Override
	public List<ComCodeVO> selectCodeGroupList() {
		return comcodeMapper.selectCodeGroupList();
	}

	@Override
	public ServiceResult insertComCodeGroup(HttpServletRequest req, ComCodeVO comCodeVO) {
		ServiceResult result = null;
		int status = comcodeMapper.insertComCodeGroup(comCodeVO);
		if(status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}
	
	@Override
	public ComCodeVO selectComCodeGroup(String comCodeGrp) {
		return comcodeMapper.selectComCodeGroup(comCodeGrp);
	}

	@Override
	public ServiceResult modifyComCodeGroup(HttpServletRequest req, ComCodeVO comCodeVO) {
		ServiceResult result = null;
		int status = comcodeMapper.modifyComCodeGroup(comCodeVO);
		if(status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public ServiceResult removeComCodeGroup(ComCodeVO comCodeVO) {
		ServiceResult result = 	null;
		comCodeVO = comcodeMapper.selectComCodeGroup(comCodeVO.getComCodeGrp());
		int status = comcodeMapper.removeComCodeGroup(comCodeVO);
		if(status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

	@Override
	public List<ComCodeVO> selectGrpList() {
		return comcodeMapper.selectGrpList();
	}

	@Override
	public ServiceResult registerComCode(HttpServletRequest req, ComCodeVO comCodeVO) {
		ServiceResult result = null;
		int status = comcodeMapper.registerComCode(comCodeVO);
		if(status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		
		return result ;
	}

	@Override
	public ServiceResult modifyComCode(HttpServletRequest req, ComCodeVO comCodeVO) {
		ServiceResult result = null;
		int status = comcodeMapper.modifyComCode(comCodeVO);
		if(status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

	@Override
	public ServiceResult removeComCode(String comCode) {
		ServiceResult result = null;
		int status = comcodeMapper.removeComCode(comCode);
		
		if(status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

	@Override
	public List<ComCodeVO> callCodeList(String comCodeGrp) {
		return comcodeMapper.callCodeList(comCodeGrp);
	}

	@Override
	public int selectCodeCount(PaginationInfoVO<ComCodeVO> pagingVO) {
		return comcodeMapper.selectCodeCount(pagingVO);
	}

	@Override
	public List<ComCodeVO> selectComCodeList(PaginationInfoVO<ComCodeVO> pagingVO) {
		return comcodeMapper.selectComCodeList(pagingVO);
	}

	@Override
	public List<ComCodeVO> selectComCodeGroupList(PaginationInfoVO<ComCodeVO> pagingVO) {
		return comcodeMapper.selectComCodeGroupList(pagingVO);
	}
	
	@Override
	public int selectCodeGroupCount(PaginationInfoVO<ComCodeVO> pagingVO) {
		return comcodeMapper.selectCodeGroupCount(pagingVO);
	}





}
