package kr.or.ddit.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.board.vo.FreeBoardVO;
import kr.or.ddit.mainpage.vo.QnAVO;
import kr.or.ddit.member.service.IMypageService;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.MyReplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco") 
public class CommunityController {
	
	@Inject
	private IMypageService mypageService;

	// 로그인 테스트
	@RequestMapping(value = "/myCommunity", method = RequestMethod.GET)
	public String myCommunityForm(HttpServletRequest req, Model model, RedirectAttributes ra) {
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		
		if (sessionMember == null) {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			return "redirect:/coco/login";
		}
		
		String memId = sessionMember.getMemId();
		
		// 게시판 리스트
		List<FreeBoardVO> freeboardVO = mypageService.selectMyFree(memId); // 자유게시판
		List<CooBoardVO> cooboardVO = mypageService.selectMyCoo(memId); // 자유게시판
		List<MyReplyVO> replyVO = mypageService.selectMyReply(memId); // 댓글 (테이블2개)
		List<QnAVO> qnaVO = mypageService.selectMyQna(memId); // qna
		
		
		model.addAttribute("list", freeboardVO); // 자유게시판 리스트
		model.addAttribute("cooList", cooboardVO); // 자유게시판 리스트
		model.addAttribute("replyList", replyVO); // 자유게시판 리스트
		model.addAttribute("qnaList", qnaVO); // 댓글 리스트
		
		return "member/community";
	}
	
	
	
	
}
