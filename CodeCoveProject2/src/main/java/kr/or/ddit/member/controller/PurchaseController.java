package kr.or.ddit.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.expert.vo.MyExpertVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMypageService;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco") 
public class PurchaseController {

	@Inject
	private IMemberService memService;
	
	@Inject
	private IMypageService mypageService;
	
	
	
	@RequestMapping(value = "/myPurchase", method = RequestMethod.GET)
	public String purchaseList(HttpServletRequest req, Model model) {
		
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");

		MemberVO member = memService.selectMember(sessionMember);
		
		List<MyExpertVO> myexpertList = memService.totalList(member); 
		
		model.addAttribute("list", myexpertList);
		
		return "member/purchase";
	}

	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contatList() {
		
		return "member/contact";
	}
	
	
	@RequestMapping(value = "/progressUpdate", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> progreeUpdate(String epayNum) {
		
		
		log.debug("데이터쳌킄킄 >> " +  epayNum);
		
		ServiceResult result = mypageService.progressUpdate(epayNum);
		
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	
	

}
