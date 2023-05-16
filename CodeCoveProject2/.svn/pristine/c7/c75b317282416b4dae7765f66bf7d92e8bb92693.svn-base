package kr.or.ddit.board.service;

import java.util.List;


import kr.or.ddit.ServiceResult;
import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.board.vo.CooFormVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.project.project.vo.ProjectVO;

public interface CooBoardService {

	public int insertCooBoard(CooBoardVO cooBoardVO);

	public List<ProjectVO> selectProjList(String memId);

	public ProjectVO selectPjId(String pjId);

	public List<CooBoardVO> selectPjBoList(PaginationInfoVO<CooBoardVO> pagingVO);

	public CooBoardVO retrievePost(String cooNm);	//게시글 상세보기

	public int insertApplyForm(CooFormVO cooFormVO);
	
	public int countCoBoList(PaginationInfoVO<CooBoardVO> pagingVO); //게시글 수 조회

	public int memberCount(String pjId);	//협업 참가인원 수

	public CooFormVO cooFormDetail(String cooFormNum);

	public void cooFormDelete(String cooFormNum);

	public ServiceResult updateCooBoard(CooBoardVO cooBoardVO);


}
