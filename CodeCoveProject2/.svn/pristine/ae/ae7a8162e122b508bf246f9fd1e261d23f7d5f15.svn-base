package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.board.vo.FreeBoardVO;
import kr.or.ddit.common.PaginationInfoVO;

public interface FreeBoardService {
	public int insertFreeBoard(FreeBoardVO freeBoardVO);
	
	//자유게시판(FreeBoardVO)+ 공지사항 첨부파일(NOTICEFILE) 목록 
	public List<FreeBoardVO> attatchNums();
	public FreeBoardVO retrievePost(String freeNum);
	public void deleteFreeBoard(String freeNum);
	public int modifyFreeBoard(Map<String, Object> map);
	
	public List<FreeBoardVO> selectFreeBoList(PaginationInfoVO<FreeBoardVO> pagingVO);

	public int countFreeBoList(PaginationInfoVO<FreeBoardVO> pagingVO);

}
