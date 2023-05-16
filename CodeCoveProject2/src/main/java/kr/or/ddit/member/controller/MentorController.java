package kr.or.ddit.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.expert.vo.MyExpertVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMypageService;
import kr.or.ddit.member.vo.ExpertVO;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco") 
public class MentorController {

	@Inject
	private IMypageService mypageService;
	
	@Inject
	private IMemberService memberService;

	
	@RequestMapping(value = "/applyMentor", method = RequestMethod.GET)
	public String applyMentorForm(HttpServletRequest req, Model model, RedirectAttributes ra) {

		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		
		if (sessionMember == null) {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			return "redirect:/coco/login";
		}
		
		String memId = sessionMember.getMemId();
		MemberVO member = memberService.selectMember(sessionMember);
		
		// 회원 상태 확인
		
		model.addAttribute("member", member);

		return "member/applyMentor";
	}
	
	
	
	
	@RequestMapping(value = "/insertMentor", method = RequestMethod.POST)
	public String applyMentorInsert(ExpertVO expertVO, RedirectAttributes ra) {

		System.out.println("새 자료 확인 직무 등등 >> " + expertVO.getExpJobMajor() + " " + expertVO.getExpJobLevel()  + " " + expertVO.getExpJobCurrent());
		System.out.println("파일 확인 >> " + expertVO.getPostFiles());
		List<AttatchVO> attatchList = expertVO.getAttatchList();
		log.info("mypost:{}", expertVO);
		log.info("attatchList:{}", attatchList);
		
		int result = mypageService.mentorInsert(expertVO);   // 최종적으로 타협!, 성능 <-> 안정성  고객의 요청
		
		if (result > 0 ) {
			ra.addFlashAttribute("message", "멘토 신청이 완료되었습니다!");  
			return "redirect:/coco/mentorList";    // redirect는 get 방식인데, model데이타을 주소표시줄에 자동으로 붙여주는 듯! 
		}
		
		return "member/applyMentor";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/insertMentorAjax", method = RequestMethod.POST)
	public String applyMentorInsertAjax(ExpertVO expertVO, RedirectAttributes ra) {
		
		String ajaxResult = "";
		
		System.out.println("파일 확인 >> " + expertVO.getPostFiles());
		List<AttatchVO> attatchList = expertVO.getAttatchList();
		log.info("mypost:{}", expertVO);
		log.info("attatchList:{}", attatchList);
		
		int result = mypageService.mentorInsert(expertVO);  
		
		if (result > 0 ) {
			ajaxResult = "ok";  
		} else {
			ajaxResult = "fail";
		}
		
		return ajaxResult;
	}
	

	@RequestMapping(value = "/mentorList", method = RequestMethod.GET)
	public String mentorListForm(HttpServletRequest req, Model model, RedirectAttributes ra) {
		
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		if (sessionMember == null) {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			return "redirect:/coco/login";
		}

		MemberVO member = memberService.selectMember(sessionMember);
		
		List<ExpertVO> myexpertList = mypageService.totalList(member);
		
		model.addAttribute("list", myexpertList);
		
		// 멘토신청내역이 N인 사람에게만 신청하기 버튼이 보임.
		if(member.getMemexpYn().equals("N")) {
			model.addAttribute("status", "g");
		}

		return "member/mentorList";
		
	}
	
	
	// 멘토 detail
	@RequestMapping(value = "/modifyMentor/{expFormNum}", method = RequestMethod.GET)
	public String modifyMentorForm(@PathVariable String expFormNum, HttpServletRequest req, Model model, RedirectAttributes ra) {

		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		
		if (sessionMember == null) {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			return "redirect:/coco/login";
		}
		
		String memId = sessionMember.getMemId();
		
		ExpertVO expertVO = mypageService.getMentorDetail(memId); // 일반 데이터
		
		String formNum = expertVO.getExpFormNum();
		List<AttatchVO> attachVO = mypageService.getAttachFiles(formNum); // 파일 가져오기 
				
		// 회원 상태 확인
		model.addAttribute("expert", expertVO);
		model.addAttribute("attach", attachVO);

		return "member/modifyMentor";
	}
	
	
	@RequestMapping(value = "/modifyMentor", method = RequestMethod.POST)
	public String modifyMentor(ExpertVO expertVO, RedirectAttributes ra) {


		List<AttatchVO> attatchList = expertVO.getAttatchList();
		log.info("mypost:{}", expertVO);
		log.info("attatchList:{}", attatchList);
		
		ServiceResult result = mypageService.mentorModify(expertVO);
		
		if (result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "멘토 수정이 완료되었습니다!");  
			return "redirect:/coco/mentorList";    // redirect는 get 방식인데, model데이타을 주소표시줄에 자동으로 붙여주는 듯! 
		}
		
		return "member/modifyMentor";
	}
	

	@ResponseBody
	@RequestMapping(value = "/modifyMentorAjax", method = RequestMethod.POST)
	public ServiceResult applyMentorModifyAjax(ExpertVO expertVO, RedirectAttributes ra) {
		
//		String ajaxResult = "";
		
		System.out.println("파일 확인 >> " + expertVO.getPostFiles());
		List<AttatchVO> attatchList = expertVO.getAttatchList();
		log.info("mypost:{}", expertVO);
		log.info("attatchList:{}", attatchList);
		
		ServiceResult result = mypageService.mentorModify(expertVO);
		
		return result;
	}
	
	
	

	
	
	
	
	
}
