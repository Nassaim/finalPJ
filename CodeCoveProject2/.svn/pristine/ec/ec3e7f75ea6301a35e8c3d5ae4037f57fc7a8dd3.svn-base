package kr.or.ddit.project.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.board.service.CooBoardService;
import kr.or.ddit.common.chat.service.IChatService;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.colleague.service.IColleagueService;
import kr.or.ddit.project.colleague.vo.ColleagueVO;
import kr.or.ddit.project.issue.service.IIssueService;
import kr.or.ddit.project.issue.vo.IssueVO;
import kr.or.ddit.project.project.service.IProjectService;
import kr.or.ddit.project.project.vo.InviteVO;
import kr.or.ddit.project.project.vo.ProjectVO;
import kr.or.ddit.project.work.service.IWorkService;
import kr.or.ddit.project.work.vo.WorkVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco/project")
public class CrudProjectController {
	
	@Inject
	private IProjectService projectService;
	
	@Inject
	private IWorkService workService;
	
	@Inject
	private IIssueService issueService;
	
	@Inject
	private IColleagueService colleagueService;
	
	@Inject
	private CooBoardService cooBoardService;
	
	@Inject
	private IChatService chatService;

	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String registerForm(ProjectVO project, Model model) {
		
//		Map<String, String> statusMap = new HashMap<String, String>();
//		statusMap.put("PS01", "모집중");
//		statusMap.put("PS02", "진행중");
//		statusMap.put("PS03", "완료");
//
//		model.addAttribute("statusMap",statusMap);
		model.addAttribute("project", project);
		return "project/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(HttpServletRequest req, ProjectVO project, Model model) {
		log.info("생성날짜" + project.getPjStartDate());
		
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		project.setPjCreatorId(sessionMember.getMemId());
		project.setPjAdminId(sessionMember.getMemId());
		
		project.setPjPnum("5");
		project.setPjStatusCode("PJST01");
		project.setPjProgress("0");
		projectService.register(project);
		
		ColleagueVO colleague = new ColleagueVO();
		colleague.setPjId(project.getPjId());
		colleague.setMemId(sessionMember.getMemId());
		colleague.setColResignYn("N");
		colleague.setPjAuthCode("PJAU02");
		colleague.setWorkRoleCode("WROL01");
		colleagueService.register(colleague);
		
		// 채팅방 insert
		String pjId = project.getPjId();
		chatService.roomCreatePj(pjId);
		
		
//		model.addAttribute("msg","등록이 완료되었습니다.");
//		return "redirect:/coco/project/detail/" + project.getPjId();
		return "redirect:/coco/project/list";
	}
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String projectList(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		String goPage = "";
		if(sessionMember == null) {
			goPage = "redirect:/coco/login";
		}else {
			String loginId = sessionMember.getMemId();
			
			List<ProjectVO> projList = projectService.list(loginId);
			
			if(projList.size() == 0) {
				goPage = "redirect:/coco/project/tutorial";
			}else {
				for(int i=0; i<projList.size(); i++) {
					String pjId = projList.get(i).getPjId();
					projList.get(i).setPjColleagueVOList(colleagueService.list(pjId));
				}
				
				model.addAttribute("loginId", loginId);
				model.addAttribute("list", projList);
				return "project/list";
			}
		}
		
		return goPage;
	}
	
	@RequestMapping(value="/detail/{pjId}",method=RequestMethod.GET)
	public String projectDetail(@PathVariable("pjId") String pjId,Model model, HttpServletRequest req, String active) {
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		String goPage = "";
		if(sessionMember == null) {
			goPage = "redirect:/coco/login";
		}else {
			String loginId = sessionMember.getMemId();

			goPage = "project/detail";
			String priCodeGrp = "WORK_PRIORITY";
			List<ProjectVO> priCode = projectService.comList(priCodeGrp);
			
			String statCodeGrp = "WORK_STATUS";
			List<ProjectVO> statCode = projectService.comList(statCodeGrp);
			
			String roleCodeGrp = "WORK_ROLE";
			List<ProjectVO> roleCode = projectService.comList(roleCodeGrp);
			
			ProjectVO project = projectService.detail(pjId);
			
			List<WorkVO> workList = workService.list(pjId);
			
			IssueVO issue = new IssueVO();
			for(int i=0; i<workList.size(); i++) {
				String workNum = workList.get(i).getWorkNum();
				issue.setWorkNum(workNum);
				workList.get(i).setIssueList(issueService.issueList(workNum));
				workList.get(i).setColleagueVOList(colleagueService.detailList(workNum));
//			WorkVO work = new WorkVO();
//			work = workService.workFileDetail(workNum);
//			System.out.println(work);
				workList.get(i).setWorkFile(workService.workFileDetail(workNum));
				System.out.println("파일 데이터" + workList.get(i).getWorkFile());
				
				List<String> memNick = new ArrayList<String>();
				String memNickAdd = "";
				System.out.println("뭐가 나오나요???"+workList.get(i).getColleagueVOList());
				for(int j=0; j<workList.get(i).getColleagueVOList().size(); j++) {
					workList.get(i).setAssignMemId(workList.get(i).getColleagueVOList().get(j).getMemNick());
					System.out.println("별명???"+workList.get(i).getAssignMemId());
					memNick.add(workList.get(i).getAssignMemId());
					System.out.println("별명++" + memNick);
//				System.out.println("별명크기" + memNick.size());
				}
				for(int k=0; k<memNick.size(); k++) {
					if(k == memNick.size()-1) {
						memNickAdd += memNick.get(k);
					}
					else if(k < memNick.size()-1) {
						memNickAdd += memNick.get(k);
						memNickAdd += ",";
					}
				}
				workList.get(i).setAssignMemId(memNickAdd);
				System.out.println("별명 전체" + workList.get(i).getAssignMemId());
			}
			System.out.println(workList);
			
			List<ColleagueVO> colleagueList = colleagueService.list(pjId);

			List<ColleagueVO> cooFormList = colleagueService.cooFormList(pjId);
			for(int i=0; i<cooFormList.size(); i++) {
				String cooFormNum = cooFormList.get(i).getCooFormNum();
				cooFormList.get(i).setCooFormFile(cooBoardService.cooFormDetail(cooFormNum));
			}
			
			model.addAttribute("priCode", priCode);
			model.addAttribute("statCode", statCode);
			model.addAttribute("roleCode", roleCode);
			model.addAttribute("loginId", loginId);
			model.addAttribute("project", project);
			model.addAttribute("workList",workList);
			model.addAttribute("colleagueList",colleagueList);
			model.addAttribute("cooFormList",cooFormList);
			if(active == null) {
				model.addAttribute("active", "1");
			}else {
				model.addAttribute("active", active);
			}
			
		}
		
		return goPage;
	}
	
	@RequestMapping(value="/invite", method=RequestMethod.POST)
	public ResponseEntity<String> inviteMail(InviteVO invite) throws Exception {
		log.info("여기 오나요?????");
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "min95ss95@naver.com";
		String hostSMTPpwd = "eoejr304";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "min95ss95@naver.com";
		String fromName = "CODE_COVE";
		String subject = invite.getInvitePjName() + " 프로젝트에 초대되었습니다.";
//		String msg = invite.getInviteContent();
		String msg = "";
		
		msg += "<!DOCTYPE html>\r\n";
		msg += "<html lang=\"ko\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n";
		msg += "\r\n" + "\r\n";
		msg += "<head style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n";
		msg += "    <meta charset=\"utf-8\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n";
		msg += "    <title style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\"></title>\r\n";
		msg += "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n";
		msg += "    \r\n";
		msg += "    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js\" charset=\"utf-8\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\"></script>\r\n";
		msg += "</head>\r\n" + "\r\n";
		msg += "<body style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;background: #f3f5ff;min-height: 100vh;display: flex;align-items: center;justify-content: center;\">\r\n";
		msg += "<div style=\"width: 80vh;margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;background: #f3f5ff;min-height: 60vh;display: flex;align-items: center;justify-content: center;\">\r\n";
		msg += "    <div class=\"login-form\" style=\"margin: 0;padding: 30px 60px;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;width: 470px;background: #ffffff;\">\r\n";
		msg += "\r\n";
		msg += "        <form action=\"\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n";
		msg += "            <div class=\"textbox\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;width: 100%;height: 50px;position: relative;margin-top: 15px;\">\r\n";
		msg += "                <h3 style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;color: #000000;\"><p><span style='font-size:16px'>Code_Cove</span><br/>"+ invite.getInvitePjName() +"초대코드 발급</p></h3>\r\n";
		msg += "            </div>\r\n";
		msg += "            <div value=\" \" class=\"login-btn\" disabled style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;width: 100%;height: 65px;margin-top: 30px;background: #ccd5ff;border: none;outline: none;text-transform: uppercase;font-weight: 700;color: #f1f1f1;transition: .3s linear;\">\r\n";
		msg += "                <br>\r\n" + "                <a href=\'http://192.168.34.58/coco/invite/register\'";
//		msg += "                <br>\r\n" + "                <a href='" + href + "gmailCheckAction.jsp?code=" + code;
		msg += "' style=\"margin:20px 0; padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;font-size: 16px;color: #581cff;\">" + invite.getInvitePjId() + "</a>\r\n";
		msg += "            </div>\r\n" + "        </form>\r\n";
		msg += "        <div class=\"dont-have-account\" style=\"margin: 20px 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;font-size: 16px;color: #000000;\">\r\n";
		msg += "            " + invite.getInviteContent() + "<br>\r\n";
		msg += "            <a href=\"http://192.168.34.58/coco/login\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;color: #000000;font-size: 12px;\">로그인하러 가기</a>\r\n";
		msg += "        </div>\r\n" + "\r\n";
		msg += "        <div style=\"font-size: 11px;color: #000000;background-color: #f3f5ff;line-height: 1.3em;padding: 10px 30px;margin-top: 30px;margin: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n";
		msg += "            본 메일은 발신 전용이므로 답변으로 문의는 불가능합니다.<br>\r\n" + "            다른 궁금하신 사항은 웹사이트(\r\n";
		msg += "            <a href=\"http://192.168.34.58/coco/loginSuccess\" target=\"_blank\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;color: 581cff;\">메인화면 상단</a>\r\n";
		msg += "            )의 FAQ에서 확인 또는 Q&A에서 문의해 주세요.<br>Copyright 2023 All rights reserved.\r\n" + "        </div>\r\n";
		msg += "</div></div></body>\r\n" + "</html>";;
		
		
		
		String mail = invite.getInviteMail();
		
		HtmlEmail email = new HtmlEmail();
		email.setDebug(true);
		email.setCharset(charSet);
		email.setSSL(true);
		email.setHostName(hostSMTP);
		email.setSmtpPort(465); //네이버 이용시 587

		email.setAuthentication(hostSMTPid, hostSMTPpwd);
		email.setTLS(true);
		email.addTo(mail, charSet);
		email.setFrom(fromEmail, fromName, charSet);
		email.setSubject(subject);
		email.setHtmlMsg(msg);
		email.send();
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String projectModify(String pjId,Model model) {
		
		String codeGrp = "PROJECT_STATE";
		List<ProjectVO> code = projectService.comList(codeGrp);
		model.addAttribute("code", code);
		
		ProjectVO project = projectService.detail(pjId);
		model.addAttribute("project", project);
		return "project/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String projectModify(ProjectVO project, Model model) {
		projectService.modify(project);
//		model.addAttribute("msg", "수정이 완료되었습니다.");
		return "redirect:/coco/project/detail/" + project.getPjId();
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String projectDelete(String pjId, Model model) {
		colleagueService.collAllDelete(pjId);
		workService.workAllDelete(pjId);
		projectService.delete(pjId);
//		model.addAttribute("msg", "삭제가 완료되었습니다.");
		return "redirect:/coco/project/list";
	}
	
	@RequestMapping(value="/adminModify", method=RequestMethod.POST)
	public String projectAdminUpdate(ProjectVO project) {
		projectService.adminModify(project);
		ColleagueVO colleague = new ColleagueVO();
		colleague.setPjId(project.getPjId());
		colleague.setMemId(project.getMemId());
		colleagueService.roleModify(colleague);
		return "redirect:/coco/project/detail/" + project.getPjId();
	}
}
