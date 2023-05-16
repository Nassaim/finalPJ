package kr.or.ddit.admin.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.PaginationInfoVO;

public interface ComcodeService {

	public List<ComCodeVO> selectCodeList();

	public ComCodeVO selectCode(String comCode);

	public List<ComCodeVO> selectCodeGroupList();

	public ServiceResult insertComCodeGroup(HttpServletRequest req, ComCodeVO comCodeVO);

	public ComCodeVO selectComCodeGroup(String comCodeGrp);
	
	public ServiceResult modifyComCodeGroup(HttpServletRequest req, ComCodeVO comCodeVO);

	public ServiceResult removeComCodeGroup(ComCodeVO comCodeVO);

	public List<ComCodeVO> selectGrpList();

	public ServiceResult registerComCode(HttpServletRequest req, ComCodeVO comCodeVO);

	public ServiceResult modifyComCode(HttpServletRequest req, ComCodeVO comCodeVO);

	public ServiceResult removeComCode(String comCode);

	public List<ComCodeVO> callCodeList(String comCodeGrp);

	public int selectCodeCount(PaginationInfoVO<ComCodeVO> pagingVO);

	public List<ComCodeVO> selectComCodeList(PaginationInfoVO<ComCodeVO> pagingVO);

	public List<ComCodeVO> selectComCodeGroupList(PaginationInfoVO<ComCodeVO> pagingVO);

	public int selectCodeGroupCount(PaginationInfoVO<ComCodeVO> pagingVO);




}
