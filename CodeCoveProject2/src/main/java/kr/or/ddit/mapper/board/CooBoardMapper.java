package kr.or.ddit.mapper.board;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.board.vo.CooFormVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mainpage.vo.QnAVO;
import kr.or.ddit.project.colleague.vo.ColleagueVO;
import kr.or.ddit.project.project.vo.ProjectVO;

public interface CooBoardMapper {

	public int insertCooBoard(CooBoardVO cooBoardVO);
    
	public List<ProjectVO> selectProjList(String memId);
    
	public ProjectVO selectPjId(String pjId);
    
	public List<CooBoardVO> selectPjBoList(PaginationInfoVO<CooBoardVO> pagingVO);
   
	public CooBoardVO selectCooBoard(Map<String, String> map);
    
	//게시글 상세보기, 조회수
	public void incrementHit(String cooNm);

	public int insertApplyForm(CooFormVO cooFormVO);
	
	//게시판 게시물 수 조회
	public int countCoBoList(PaginationInfoVO<CooBoardVO> pagingVO);

	public int participantNum(String cooNm);

	public CooFormVO cooFormDetail(String cooFormNum);

	public void cooFormDelete(String cooFormNum);

	public int updateCooBoard(CooBoardVO cooBoardVO);







}
