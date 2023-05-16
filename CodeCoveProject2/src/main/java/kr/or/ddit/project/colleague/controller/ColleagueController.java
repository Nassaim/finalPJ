package kr.or.ddit.project.colleague.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.board.service.CooBoardService;
import kr.or.ddit.common.attatch.service.AttatchService;
import kr.or.ddit.project.colleague.service.IColleagueService;
import kr.or.ddit.project.colleague.vo.ColleagueVO;
import kr.or.ddit.project.work.service.IWorkService;
import kr.or.ddit.project.workAssign.service.IWorkAssignService;

@Controller
@RequestMapping("/coco/colleague")
public class ColleagueController {

	@Inject
	private IColleagueService colleagueService;
	
	@Inject
	private CooBoardService cooBoardService;
	
	@Inject
	private AttatchService attatchService;
	
	@Inject
	private IWorkAssignService workAssignService;
	
	@Inject
	private IWorkService workService;

	@RequestMapping(value="/selectRoleModify", method=RequestMethod.POST)
	public ResponseEntity<String> selectRoleUpdate(ColleagueVO colleague) {
		System.out.println("역할 변경" + colleague.getPjId());
		System.out.println("역할 변경" + colleague.getColNum());
		System.out.println("역할 변경" + colleague.getWorkRoleCode());
		colleagueService.selectRoleModify(colleague);
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}
	
	@RequestMapping(value="/collRegister", method=RequestMethod.POST)
	public ResponseEntity<String> collRegister(ColleagueVO colleague){
		colleague.setColResignYn("N");
		colleague.setPjAuthCode("PJAU02");
		colleague.setWorkRoleCode("WROL05");
		colleagueService.register(colleague);
		
		String cooFormNum = colleague.getCooFormNum();
		cooBoardService.cooFormDelete(cooFormNum);
		
		attatchService.cooFormFileDelete(cooFormNum);
		
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}
	
	@RequestMapping(value="/cooFormDelete", method=RequestMethod.POST)
	public ResponseEntity<String> cooFormDelete(String cooFormNum){
		cooBoardService.cooFormDelete(cooFormNum);
		attatchService.cooFormFileDelete(cooFormNum);
		
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}
	
	@RequestMapping(value="/colleagueExit", method=RequestMethod.POST)
	public ResponseEntity<String> colleagueExit(ColleagueVO colleague){
		String colNum = colleague.getColNum();
		workAssignService.workAssignExit(colNum);
		workService.workExit(colleague);
		colleagueService.collExit(colNum);
		
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}
}