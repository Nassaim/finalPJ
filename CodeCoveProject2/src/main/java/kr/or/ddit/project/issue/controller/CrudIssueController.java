package kr.or.ddit.project.issue.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.issue.service.IIssueService;
import kr.or.ddit.project.issue.vo.IssueVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco/issue")
public class CrudIssueController {
	
	@Inject
	private IIssueService issueService;
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public ResponseEntity<IssueVO> issueRegister(IssueVO issue, HttpServletRequest req){
		
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		issue.setIssueReq(sessionMember.getMemId());
		log.info("내용" + issue.getIssueContent());
		
		IssueVO result = issueService.register(issue);
		System.out.println("123"+result);
		return new ResponseEntity<IssueVO>(result, HttpStatus.OK);
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public ResponseEntity<String> issueDelete(String issueNum){
		log.info("삭제용 이슈 번호:" + issueNum);
		
		issueService.delete(issueNum);
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
}
