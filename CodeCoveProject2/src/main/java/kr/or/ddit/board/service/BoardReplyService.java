package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.BoReplyVO;

public interface BoardReplyService {

	//해당 게시글에 있는 댓글 조회
	public List<BoReplyVO> retrieveReplyList(String freeNum);
	
	//댓글 추가
	public String createReply(BoReplyVO boReplyVO);
	

}
