package kr.or.ddit.board.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.service.BoardReplyService;
import kr.or.ddit.board.vo.BoReplyVO;
import kr.or.ddit.mapper.board.BoardReplyMapper;

@Service
public class BoardReplyServiceImpl implements BoardReplyService {
	
	@Inject
	private BoardReplyMapper replyMapper;
	
	//게시글 댓글 조회
	@Override
	public List<BoReplyVO> retrieveReplyList(String boReplyTarget) {
		List<BoReplyVO> replyList = replyMapper.selectBoReplyList(boReplyTarget);
		return replyList;
	}
	
	//댓글 추가
	@Override
	public String createReply(BoReplyVO boReplyVO) {
		int cnt = replyMapper.insertBoReply(boReplyVO);
		String msg = null;
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		return msg;
	}

}
