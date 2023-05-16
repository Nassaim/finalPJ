package kr.or.ddit.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco") 
public class ProfileController {

	@Inject
	private IMemberService memberService;
	
	@RequestMapping(value = "/profileConfirm", method = RequestMethod.GET)
	public String profileConfirm(HttpServletRequest req, RedirectAttributes ra, Model model) {

		String goPage = "";
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");


		if (sessionMember == null) {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			return "redirect:/coco/login";
		}

		MemberVO member = memberService.selectMember(sessionMember);

		if (member != null) {
			model.addAttribute("member", member);
			goPage = "member/profileConfirm";
		} else {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			goPage = "redirect:/coco/login";
		}
		return goPage;
	}
	
	
	@PostMapping(value = "/profileConfirm")
	public String profileConfirm(HttpServletRequest req,  RedirectAttributes ra, String memPass) {
		String goPage = "";
		
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		String memId = sessionMember.getMemId();
		
		log.info("비번체크 아디>  " + memId + " 비번체크 비번 > " + memPass);
		
		String result = memberService.passCheck(memId, memPass);
		
		
		
		if(result.equals("ok")) {
			goPage = "redirect:/coco/profile";
		} else {
			ra.addFlashAttribute("message", "비밀번호가 틀렸습니다.");
			goPage = "redirect:/coco/profileConfirm";
		}
		
		return goPage;
	}
	

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profileForm(HttpServletRequest req, RedirectAttributes ra, Model model) {

		String goPage = "";
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");


		if (sessionMember == null) {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			return "redirect:/coco/login";
		}

		MemberVO member = memberService.selectMember(sessionMember);

		if (member != null) {
			model.addAttribute("member", member);
			goPage = "member/profile";
		} else {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			goPage = "redirect:/coco/login";
		}
		return goPage;
	}

	@RequestMapping(value = "/profileUpdate", method = RequestMethod.POST)
	public String profileUpdate(HttpServletRequest req, RedirectAttributes ra, Model model, MemberVO memberVO) {

		String goPage = "";
		
		ServiceResult result = memberService.profileUpdate(req, memberVO);
		if (result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "회원정보 수정이 완료되었습니다!");
			goPage = "redirect:/coco/profile";
		} else {
			model.addAttribute("member", memberVO);
			goPage = "member/profile";
		}
		return goPage;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/passCheck", method = RequestMethod.POST)
	public String passCheck(String memId, String memPass) {
		
		log.info("비번체크 아디>  " + memId + " 비번체크 비번 > " + memPass);
		
		String result = memberService.passCheck(memId, memPass);
		
		return result;
	}

	
	
	@RequestMapping(value = "/passUpdate", method = RequestMethod.POST)
	public String passUpdate(String updateMemId, String updPassNew, RedirectAttributes ra, Model model) {
		
		String goPage = "";
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(updateMemId);
		memberVO.setMemPass(updPassNew);
		
		ServiceResult result = memberService.passUpdate(memberVO);
		
		
		if (result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "비밀번호 변경이 완료되었습니다!");
			goPage = "redirect:/coco/profile";
		} else {
			model.addAttribute("member", memberVO);
			goPage = "member/profile";
		}
		return goPage;
	}
	
	
	// 마이페이지 회원탈퇴
	@RequestMapping(value = "/userWithdraw", method = RequestMethod.POST)
	public String userWithdraw(String memId, RedirectAttributes ra) { 
		
		String goPage = "";
		
		ServiceResult result = memberService.userWithdraw(memId);
		
		if (result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다.");
			goPage = "redirect:/coco/login";
			
		} else {
			goPage = "member/profile";
		}
		return goPage;
	}
	
	
} // end
