package kr.or.ddit.expert.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.expert.service.IEprodService;
import kr.or.ddit.expert.service.ITemplateReviewService;
import kr.or.ddit.expert.vo.ExpertProdVO;
import kr.or.ddit.expert.vo.TemplateReviewVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class templateReviewController {


//템플릿 리뷰를 작성할 건데 AJAX로 진행할 것임 따라서 RETURN값은 SUCCESS의 패러미터
//1.멤버닉네임을 가져와야 하므로 세션을 넘긴다
//2.구매내역인서트 방식으로 EPROD_NUM을 가져온다
//	->나중에 댓글을 리스트로 뽑기 위해서 WHERE조건으로 사용할 예정
	
	
	@Inject
	private IMemberService memberService;
	
	@Inject
	private IEprodService prodService;
	
	private ITemplateReviewService reviewService;
	
	
	@PostMapping(value="/templateReview",produces = "application/json;charset=utf-8")
	@ResponseBody  // 직접응답, view로 돌리지 않음, 아작스용은 이게 붙어 있어야 함	
	public String templateReview(@RequestBody Map<String,String> jsonMap,
								  HttpServletRequest req, Model model
								  ,String eprodNum) {

//		1.로그인세션에 담긴 value를 jsp로 넘기기 여기서는 id랑 닉네임
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");		
		MemberVO member = memberService.selectMember(sessionMember);
		ExpertProdVO expertProdVO = new ExpertProdVO();
		expertProdVO.setMemId(sessionMember.getMemId());//세션에서 가져온 아이디 담기
		expertProdVO.setMemNick(sessionMember.getMemNick());//세션에서 가져온 닉네임 담기
		model.addAttribute("member", member);//모델로 닉네임 jsp로 넘겼음
		
//		2.eprod_num의 값을 jsp로 보내서 보낸 값을 ${}로 받아서 insert할 것임
		ExpertProdVO expertProd = prodService.templateDetail(eprodNum);
		model.addAttribute("expertProd", expertProd);
		log.debug("expertProd에 뭐가 들었니?",expertProd);		
		
//		3.이 부분에 ajax로 넘어온 결과값을 받아서 담아서 인서트 함
		TemplateReviewVO templateReviewVO = new TemplateReviewVO();
		templateReviewVO.setReviewNum(jsonMap.get("eprodNum"));
//		templateReviewVO.setReviewNum(jsonMap.get("reviewTitle"));
		templateReviewVO.setReviewNum(jsonMap.get("reviewContent"));
//		templateReviewVO.setReviewNum(jsonMap.get("reviewStar"));
		templateReviewVO.setReviewNum(jsonMap.get("reviewWriter"));
		templateReviewVO.setMemProfile(jsonMap.get("memProfile"));
//		templateReviewVO.setReviewNum(jsonMap.get("reviewDate"));
		reviewService.reviewInsert(templateReviewVO);
		
		return "templateReviewVO";
	}
	

}
