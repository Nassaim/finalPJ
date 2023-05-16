package kr.or.ddit.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.board.service.FreeBoardService;
import kr.or.ddit.board.vo.FreeBoardVO;
import kr.or.ddit.common.attatch.service.AttatchService;
import kr.or.ddit.member.vo.MemberVO;


@Controller
@RequestMapping("/freeBoard")
public class FreeBoardIncertController {
	
	@Inject
	private FreeBoardService service;
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String freeBoardForm() {
		return "board/freeBoard/form";
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertProcess(
			HttpServletRequest req,
			@ModelAttribute("freeBoardVO") FreeBoardVO freeBoardVO,
			Errors error
			) {
		String goPage = "";
		HttpSession session= req.getSession();
		MemberVO memberVO=(MemberVO) session.getAttribute("SessionInfo");
		if(memberVO !=null) {
			freeBoardVO.setWriterId(memberVO.getMemId());
			int rowcnt= service.insertFreeBoard(freeBoardVO);
			if(rowcnt>0) {
				goPage="redirect:/freeBoard/list";
			}else {
				goPage="board/freeBoard/form";
			}
		}else {
			goPage="redirect:/coco/login";
		}
		return goPage;
	}

}
