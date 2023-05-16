package kr.or.ddit.mapper.admin;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.PaginationInfoVO;

@Mapper
public interface ComcodeMapper {

	public List<ComCodeVO> selectCodeList();

	public ComCodeVO selectCode(String comCode);

	public List<ComCodeVO> selectCodeGroupList();

	public int insertComCodeGroup(ComCodeVO comCodeVO);

	public ComCodeVO selectComCodeGroup(String comCodeGrp);
	
	public int modifyComCodeGroup(ComCodeVO comCodeVO);

	public int removeComCodeGroup(ComCodeVO comCodeVO);

	public List<ComCodeVO> selectGrpList();

	public int registerComCode(ComCodeVO comCodeVO);

	public int modifyComCode(ComCodeVO comCodeVO);

	public int removeComCode(String comCode);

	public List<ComCodeVO> callCodeList(String comCodeGrp);

	public int selectCodeCount(PaginationInfoVO<ComCodeVO> pagingVO);

	public List<ComCodeVO> selectComCodeList(PaginationInfoVO<ComCodeVO> pagingVO);

	public List<ComCodeVO> selectComCodeGroupList(PaginationInfoVO<ComCodeVO> pagingVO);

	public int selectCodeGroupCount(PaginationInfoVO<ComCodeVO> pagingVO);






}
