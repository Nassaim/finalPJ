package kr.or.ddit.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.springframework.http.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.board.service.BoardReplyService;
import kr.or.ddit.board.vo.BoReplyVO;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardReplyController {

	@Inject
	BoardReplyService BoReplyService;
	
	//댓글 조회
	@ResponseBody
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE, value="{memId}/reply/{freeNum}", method = RequestMethod.GET )
	public Map<String, Object> ReplyList(@PathVariable String freeNum){
		Map<String, Object> map=new HashMap<String, Object>();
		List<BoReplyVO> replyList=BoReplyService.retrieveReplyList(freeNum);
		map.put("replyList", replyList);
		return map;
	}
	
	//댓글 추가
	@ResponseBody
	@PostMapping(path = "/reply/write", produces = "application/text; charset=utf8")
	public String writeReply(@RequestBody BoReplyVO boReplyVO) {
		String msg = BoReplyService.createReply(boReplyVO);
		return msg;
	}
	
}
