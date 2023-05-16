package kr.or.ddit.project.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.colleague.service.IColleagueService;
import kr.or.ddit.project.issue.service.IIssueService;
import kr.or.ddit.project.project.service.IJProjectService;
import kr.or.ddit.project.project.service.IProjectService;
import kr.or.ddit.project.project.vo.ProjectVO;
import kr.or.ddit.project.work.service.IWorkService;
import kr.or.ddit.project.work.vo.WorkVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/coco/project")
public class JProjectController {

	@Inject //세션용
	private IMemberService memberService;
	
	@Inject //프로젝트용
	private IJProjectService projectService;
	
	@Inject
	private IWorkService workService;
	
	@Inject
	private IProjectService msProjectService;
	
	@Inject
	private IColleagueService colleagueService;
	
	@Inject
	private IIssueService issueService;
	
	@RequestMapping("/jRepositoryList")
	public String jRepositoryList(HttpServletRequest req, Model model, String memId) {
		
		//로그인 세션을 담아서 조건의 memId에 넣을거예요
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		MemberVO member = memberService.selectMember(sessionMember);

		ProjectVO projectVO = new ProjectVO();
		projectVO.setMemId(member.getMemId());
		
		
		//로그인 한 아이디에 속한 프로젝트의 리스트를 가져올 거예요
		List<ProjectVO> projectAllList = projectService.projectAllList(member.getMemId());
		log.debug("projectAllList에 뭐 들었어?"+projectAllList);
//		log.debug("프젝리스트의0번은?"+projectAllList.get(0));
//		log.debug("프젝리스트의1번은?"+projectAllList.get(1));

		//jsp로 값 넘기기
		model.addAttribute("member", member);
		model.addAttribute("projectAllList",projectAllList);

		return "project/JRepositoryList";
	}
	
	
	@RequestMapping("/JRepoWorkList")
	public String JRepoWorkList(String pjId, Model model ) {
		List<WorkVO> workList = projectService.repoWorkList(pjId);
		model.addAttribute("workList", workList);
		log.debug("workList에 뭐들었니?"+workList);
		return "project/JRepoWorkList";
	}
	
	@RequestMapping("/JRepoDownload")
	public String JRepoDownload(String workNum, Model model) {
		
		
		
		WorkVO downloadList = projectService.downloadList(workNum);
		log.debug("DownloadList에 뭐 들었어?"+ downloadList);
//		log.debug("다운로드리스트0번뭐야"+downloadList.getAttatchList().get(0));
		model.addAttribute("downloadList", downloadList);
		return "project/JRepoDownload";
		
	}
	
	@RequestMapping("/allWork")
	public String allWork(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
//		MemberVO member = memberService.selectMember(sessionMember);
		
//		WorkVO workVO = new WorkVO();
//		workVO.setMemId(member.getMemId());
		
//		List<WorkVO> workList = projectService.workAllList(member.getMemId());
//		log.debug("workList에 뭐 들었어?" +workList);
		
		String goPage = "";
		if(sessionMember == null) {
			goPage = "redirect:/coco/login";
		}else {
			String loginId = sessionMember.getMemId();
			List<WorkVO> workList = workService.myCalList(loginId);
			for(int i=0; i<workList.size(); i++) {
				String workNum = workList.get(i).getWorkNum();
				workList.get(i).setIssueList(issueService.issueList(workNum));
				workList.get(i).setColleagueVOList(colleagueService.detailList(workNum));
				workList.get(i).setWorkFile(workService.workFileDetail(workNum));
				
				List<String> memNick = new ArrayList<String>();
				String memNickAdd = "";
				for(int j=0; j<workList.get(i).getColleagueVOList().size(); j++) {
					workList.get(i).setAssignMemId(workList.get(i).getColleagueVOList().get(j).getMemNick());
					memNick.add(workList.get(i).getAssignMemId());
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
				
				String pjId = workList.get(i).getPjId();
				workList.get(i).setColleagueVOList(colleagueService.list(pjId));
				workList.get(i).setMyProjectVO(msProjectService.detail(pjId));
				
			}
			
			String priCodeGrp = "WORK_PRIORITY";
			List<ProjectVO> priCode = msProjectService.comList(priCodeGrp);
			
			String statCodeGrp = "WORK_STATUS";
			List<ProjectVO> statCode = msProjectService.comList(statCodeGrp);
			
			model.addAttribute("loginId", loginId);
			model.addAttribute("workList", workList);
			model.addAttribute("priCode", priCode);
			model.addAttribute("statCode", statCode);
			
			return "project/JAllWork";
		}
		
		return goPage;
		
	}
	
	
	@RequestMapping("/datatable")
	public String jataTable() {
		return "solutions/JDataTable";
		
	}
	
	
	
}












