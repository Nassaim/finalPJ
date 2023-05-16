package kr.or.ddit.project.work.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.common.attatch.service.AttatchService;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.issue.service.IIssueService;
import kr.or.ddit.project.work.service.IWorkService;
import kr.or.ddit.project.work.vo.WorkVO;
import kr.or.ddit.project.workAssign.service.IWorkAssignService;
import kr.or.ddit.project.workAssign.vo.workAssignVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco/work")
public class CrudWorkController {
	
	@Inject
	private IWorkService workService;
	
	@Inject
	private IWorkAssignService workAssignService;
	
	@Inject
	private IIssueService issueService;
	
	@Inject
	private AttatchService attatchService;

	@RequestMapping(value="/register/{pjId}", method=RequestMethod.POST)
	public String registerForm(@PathVariable("pjId") String pjId, WorkVO work, HttpServletRequest req) {
		log.info("프로젝트아이디"+pjId);
		
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		work.setWorkReq(sessionMember.getMemId());
		work.setMemId(sessionMember.getMemId());
        
//        List<String> colorList = new ArrayList<String>();
        String[] colorList = {"#ffb3b3", "#b3b3ff", "#b3ffb3", "#ffff99", "#ffdb99", "#ffb3ff", "#ffb3be", "#cccccc"};
        Random random = new Random();
        int randomIndex = random.nextInt(colorList.length);
        System.out.println("랜덤색" + colorList[randomIndex]);
        work.setWorkColor(colorList[randomIndex]);
		
		work.setPjId(pjId);
		work.setWorkProgress("0");
		work.setParentWorkNum("0");
		workService.register(work);
		
		String assign = work.getAssignMemId();
		List<String> assignList = new ArrayList<String>();
		
		String[] splitAssign = assign.split(",");
		for(int i=0; i<splitAssign.length; i++) {
			assignList.add(splitAssign[i]);
		}
		System.out.println("담당자???"+assignList);
		System.out.println("업무번호:"+ work.getWorkNum());
		
		workAssignVO workAssign = new workAssignVO();
		workAssign.setWorkNum(work.getWorkNum());
		workAssign.setAssignmentDelYn("N");
		for(int j=0; j<assignList.size(); j++) {
			workAssign.setColNum(assignList.get(j));
			workAssignService.register(workAssign);
		}
		
		return "redirect:/coco/project/detail/" + work.getPjId();
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String workDelete(WorkVO work) {
		String workNum = work.getWorkNum();
		workAssignService.delete(work.getWorkNum());
		issueService.allDelete(workNum);
		attatchService.workFileAllDelete(workNum);
		workService.delete(workNum);
		return "redirect:/coco/project/detail/" + work.getPjId();
		
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ResponseEntity<String> workUpdate(WorkVO work) {
		workService.modify(work);
		
		System.out.println("변경 담당자 아이디" + work.getAssignMemId());
		String assign = work.getAssignMemId();
		List<String> assignList = new ArrayList<String>();
		
		String[] splitAssign = assign.split(",");
		for(int i=0; i<splitAssign.length; i++) {
			assignList.add(splitAssign[i]);
		}
//		List<workAssignVO> assignDeleteList = workAssignService.list(work.getWorkNum());
//		for(int i=0; i<assignDeleteList.size(); i++) {
//			
//		}
		workAssignService.delete(work.getWorkNum());
		
		workAssignVO workAssign = new workAssignVO();
		workAssign.setWorkNum(work.getWorkNum());
		workAssign.setAssignmentDelYn("N");
		for(int j=0; j<assignList.size(); j++) {
			workAssign.setColNum(assignList.get(j));
			workAssignService.register(workAssign);
		}
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	
	@RequestMapping(value="/boardModify", method=RequestMethod.POST)
	public ResponseEntity<String> workStatusUpdate(WorkVO work){
		System.out.println("상태변경 넘기기");
			workService.boardModify(work);
		
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}
	
}
