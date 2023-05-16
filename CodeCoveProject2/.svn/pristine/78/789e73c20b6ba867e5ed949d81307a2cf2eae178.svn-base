package kr.or.ddit.mapper.board;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.FreeBoardVO;
import kr.or.ddit.common.PaginationInfoVO;


public interface FreeBoardMapper {
	public int insertFreeBoard(FreeBoardVO freeBoardVO);
	public int insertFreeBoardAttatches(FreeBoardVO freeBoardVO);
//	public FreeBoardVO read(String freeNum);
	public void incrementHit(String freeNum);
	
	//자유게시판(FreeBoardVO)+ 공지사항 첨부파일(NOTICEFILE) 목록 
	public List<FreeBoardVO> attatchNums();
	public FreeBoardVO selectFreeBoard(Map<String, String> map);
	public int updateFreeBoard(FreeBoardVO freeBoardVO);
	public void deleteFreeBoard(String freeNum);
	public List<FreeBoardVO> selectFreeBoList(PaginationInfoVO<FreeBoardVO> pagingVO);
	public int countFreeBoList(PaginationInfoVO<FreeBoardVO> pagingVO);

}
