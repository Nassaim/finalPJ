package kr.or.ddit.project.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.colleague.service.IColleagueService;
import kr.or.ddit.project.colleague.vo.ColleagueVO;

@Controller
@RequestMapping("/coco/invite")
public class InviteController {
	
	@Inject
	private IColleagueService colleagueService;

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerForm(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		String goPage = "";
		if(sessionMember == null) {
			goPage = "redirect:/coco/login";
		}else {
			goPage = "project/invite";
		}
		return goPage;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(HttpServletRequest req, String pjId) {
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		ColleagueVO colleague = new ColleagueVO();
		colleague.setPjId(pjId);
		System.out.println("pjId???" + pjId);
		colleague.setMemId(sessionMember.getMemId());
		colleague.setColResignYn("N");
		colleague.setPjAuthCode("PJAU02");
		colleague.setWorkRoleCode("WROL05");
		colleagueService.register(colleague);
		
		return "redirect:/coco/project/detail/" + pjId;
	}
}
