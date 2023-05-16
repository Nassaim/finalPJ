package kr.or.ddit.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.board.vo.BoReplyVO;

@Mapper
public interface BoardReplyMapper {
	
	//해당 게시글 댓글 조회
	List<BoReplyVO> selectBoReplyList(String freeNum);

	//댓글 추가
	int insertBoReply(BoReplyVO boReplyVO);

}
