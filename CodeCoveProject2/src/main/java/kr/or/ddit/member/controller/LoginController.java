package kr.or.ddit.member.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.util.Utils;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.CreateBlogVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco") 
public class LoginController {

	@Inject
	private IMemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(name = "stat", required = false, defaultValue = "0") int stat, Model model) {
		if (stat == 1) {
			model.addAttribute("message", "회원가입을 완료하였습니다!");
		}
		model.addAttribute("bodyText", "login-page");
		return "logins/login";
	}
	
	@RequestMapping(value = "/logout")
	public String logOut(HttpServletRequest req) {
		
		// req.getSession(false) -> 세션이 있으면 기존 세션 반환 / 없으면 null 반환
		HttpSession session = req.getSession(false); 
		
		if(session != null) { // 세션이 있는 상태라면
			session.invalidate();
		}
		return "redirect:/coco/main";
	}

	// 로그인 테스트
	@RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
	public String loginSucces() {
		
		
		return "redirect:/coco/main";
//		return "logins/loginSuccess";
	}
	// 테스트
	@RequestMapping(value = "/google", method = RequestMethod.GET)
	public String google() {
		return "logins/google";
	}

	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest req, MemberVO member, Model model) {
		String goPage = "";
		
		Map<String, String> errors = new HashMap<String, String>();
		
		String newMemId = member.getMemId();
		
		int chkWithdrawId = memberService.checkWithdrawId(newMemId);
		
		if (chkWithdrawId > 0) {
			errors.put("memId", "아이디가 존재하지 않습니다.");
		}
		
		if (StringUtils.isBlank(member.getMemId())) {
			errors.put("memId", "아이디를 입력해주세요!");
		}
		if (StringUtils.isBlank(member.getMemPass())) {
			errors.put("memPass", "비밀번호를 입력해주세요!");
		}

		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("member", member);
			model.addAttribute("bodyText", "login-page");
			goPage = "logins/login";
		} else {
			
			String inputPass = member.getMemPass();
			MemberVO memberVO = memberService.loginCheck(member);
			if (memberVO != null && inputPass.equals(memberVO.getMemPass())) { // 로그인 성공
				// 로그인 성공 후, 세션 처리
				HttpSession session = req.getSession();
				session.setAttribute("SessionInfo", memberVO);
				goPage = "redirect:/coco/loginSuccess";
			} else {
				model.addAttribute("message", "로그인 정보를 정확하게 입력해주세요!");
				model.addAttribute("member", member);
				model.addAttribute("bodyText", "login-page");
				goPage = "logins/login";
			}
		}
		return goPage;
	}
	
	

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		model.addAttribute("bodyText", "register-page");
		return "logins/register";
	}

	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> idCheck(String memId) {
		ServiceResult result = memberService.idCheck(memId);
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(@RequestBody Map<String, String> jsonMap, HttpServletRequest req, Model model) {
		String goPage = "";

//		for (String key : jsonMap.keySet()) {
//			System.out.println("돌려돌려 key : " + key + "value : " + jsonMap.get(key));
//		}
		
		
		MemberVO memberVO = new MemberVO();
		if(jsonMap.get("memProfile") != null) {
			memberVO.setMemProfile(jsonMap.get("memProfile"));
		}
		memberVO.setMemId(jsonMap.get("memId"));
		memberVO.setMemPass(jsonMap.get("memPass"));
		memberVO.setMemName(jsonMap.get("memName"));
		memberVO.setMemNick(jsonMap.get("memNick"));
		memberVO.setMemMail(jsonMap.get("memMail"));
		memberVO.setMemHP(jsonMap.get("memHP"));

		
		log.debug("signup 널셉션 확인 : {} " + memberVO);
		
//		Map<String, String> errors = new HashMap<String, String>();
//		if (StringUtils.isBlank(memberVO.getMemId())) {
//			errors.put("memId", "아이디를 입력해주세요!");
//		}
//		if (StringUtils.isBlank(memberVO.getMemPass())) {
//			errors.put("memPass", "비밀번호를 입력해주세요!");
//		}
//		if (StringUtils.isBlank(memberVO.getMemName())) {
//			errors.put("memName", "이름을 입력해주세요!");
//		}
//
//		if (errors.size() > 0) { // 에러가 발생!
//			model.addAttribute("bodyText", "register-page");
//			model.addAttribute("errors", errors);
//			model.addAttribute("member", memberVO);
////			goPage = "member/register";
//			goPage = "0";
			
//		} else { // 정상적으로 처리
			ServiceResult result = memberService.signup(req, memberVO); 
			
			// 회원가입시 블로그 생성
			CreateBlogVO createBlog = new CreateBlogVO();
			createBlog.setBloggerId(memberVO.getMemId());
			memberService.createBlog(createBlog);
			BlogCateVO blogCate = new BlogCateVO();
			blogCate.setBlogId(createBlog.getBlogId());
			memberService.createBlogCategory(blogCate);
			
			if (result.equals(ServiceResult.OK)) {
//				goPage = "redirect:/login.do?stat=1";
				goPage = "0";
			} else {
				model.addAttribute("bodyText", "register-page");
				model.addAttribute("message", "서버에러, 다시 시도해주세요!");
				model.addAttribute("member", memberVO);
//				goPage = "member/register";
				goPage = "1";
			}
//		} // else 
		return goPage;
	}

	@RequestMapping(value = "/forget", method = RequestMethod.GET)
	public String loginForgetIdAndPw(Model model) {
		model.addAttribute("bodyText", "login-page");
		return "logins/forget";
	}

	@RequestMapping(value = "/idForget", method = RequestMethod.POST)
	public ResponseEntity<String> idForgetProcess(MemberVO member) {
		String memId = memberService.idForgetProcess(member);
		
		return new ResponseEntity<String>(memId, HttpStatus.OK);
	}

	@RequestMapping(value = "/pwForget", method = RequestMethod.POST)
	public ResponseEntity<String> pwForgetProcess(MemberVO member) {
		String memPass = memberService.pwForgetProcess(member);
		return new ResponseEntity<String>(memPass, HttpStatus.OK);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/verifyRecaptcha.do", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
		log.info("VerifyRecaptcha 컨트롤러 작동");
		
		// 시크릿 키를 캡챠를 받아올수 있는 Class에 보내서 그곳에서 값을 출력한다
		VerifyRecaptcha.setSecretKey("6Lc4SyElAAAAAB5dxeQu7iBfYc6AOxfot47iFGvK");
		String gRecaptchaResponse = request.getParameter("recaptcha");
		
		try {
			if (VerifyRecaptcha.verify(gRecaptchaResponse)) {
				return 0; // 성공
			} else
				return 1; // 실패
		} catch (Exception e) {
			e.printStackTrace();
			return -1; // 에러
		}
	}
	
	

}
