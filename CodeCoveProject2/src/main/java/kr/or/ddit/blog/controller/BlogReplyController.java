package kr.or.ddit.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.blog.service.BlogReplyService;
import kr.or.ddit.blog.vo.BlogReplyVO;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/blog")
public class BlogReplyController {
	@Inject
	BlogReplyService replyService;

	@ModelAttribute("blogReplyVO")
	public BlogReplyVO getBlogReplyVO() {
		return new BlogReplyVO();
	}

	// 댓글 조회
	@ResponseBody
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE, value = "{memId}/reply/{postNum}", method = RequestMethod.GET)
	public Map<String, Object> ReplyList(@PathVariable String postNum) {
		Map<String, Object> map = new HashMap<>();
		List<BlogReplyVO> replyList = replyService.retrieveReplyList(postNum);
		map.put("replyList", replyList);
		return map;
	}

	// 댓글 추가
	@ResponseBody
	@PostMapping(path = "{memId}/reply/write", produces = "application/text; charset=utf8")
	public String writeReply(@RequestBody BlogReplyVO blogReplyVO, Errors errors,
			@PathVariable(value = "memId") String memId,
			HttpServletRequest req) {
		HttpSession session=req.getSession();
		MemberVO memberVO=(MemberVO) session.getAttribute("SessionInfo");
		String loginId=memberVO.getMemId();
		if (!errors.hasErrors()) {
			blogReplyVO.setBloggerId(memId);
			blogReplyVO.setBlReplyWriter(loginId);
			String msg = replyService.createReply(blogReplyVO);
			return msg;

		} else {
			return "부적절";
		}
	}

	// 대댓글 추가
	@ResponseBody
	@PostMapping(path = "{memId}/reply/reWrite", produces = "application/text; charset=utf8")
	public String reWriteReply(@RequestBody BlogReplyVO blogReplyVO, Errors errors,
			@PathVariable(value = "memId") String memId) {
		if (!errors.hasErrors()) {
			blogReplyVO.setBloggerId(memId);
			String msg = replyService.createReReply(blogReplyVO);
			return msg;

		} else {
			return "부적절";
		}
	}

	// 댓글 수정
	@ResponseBody
	@PostMapping(path = "{memId}/reply/upWrite", produces = "application/text; charset=utf8")
	public String modifyReply(@RequestBody BlogReplyVO blogReplyVO, Errors errors,
			@PathVariable(value = "memId") String memId) {
		if (!errors.hasErrors()) {
			String msg = replyService.modifyReply(blogReplyVO);
			return msg;

		} else {
			return "부적절";
		}
	}

	// 댓글 삭제
	@ResponseBody
	@GetMapping(path = "{memId}/reply/delReply", produces = "application/text; charset=utf8")
	public String delReply(@RequestParam(value = "delNum") String delNum) {

		String msg = replyService.removeReply(delNum);
		return msg;
	}

}
