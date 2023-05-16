package kr.or.ddit.project.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.colleague.service.IColleagueService;
import kr.or.ddit.project.colleague.vo.ColleagueVO;
import kr.or.ddit.project.work.service.IWorkService;
import kr.or.ddit.project.work.vo.WorkVO;

@Controller
@RequestMapping("/coco/myBoard")
public class MyProjBoardController {
	
	@Inject
	private IWorkService workService;
	
	@Inject
	private IColleagueService colleagueService;
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public String myProjBoard(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		String goPage ="";
		if(sessionMember == null) {
			goPage = "redirect:/coco/login";
		}else {
			String loginId = sessionMember.getMemId();
			
			List<WorkVO> workMyBoardList = workService.myCalList(loginId);
			for(int i=0; i<workMyBoardList.size(); i++) {
				String workNum = workMyBoardList.get(i).getWorkNum();
				workMyBoardList.get(i).setColleagueVOList(colleagueService.detailList(workNum));
				
				List<String> memNick = new ArrayList<String>();
				String memNickAdd = "";
				for(int j=0; j<workMyBoardList.get(i).getColleagueVOList().size(); j++) {
					workMyBoardList.get(i).setAssignMemId(workMyBoardList.get(i).getColleagueVOList().get(j).getMemNick());
					memNick.add(workMyBoardList.get(i).getAssignMemId());
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
				workMyBoardList.get(i).setAssignMemId(memNickAdd);
				System.out.println("별명 전체" + workMyBoardList.get(i).getAssignMemId());
				
				String pjId = workMyBoardList.get(i).getPjId();
				workMyBoardList.get(i).setColleagueVOList(colleagueService.list(pjId));
				System.out.println(workMyBoardList.get(i).getColleagueVOList());
			}
			model.addAttribute("workMyBoardList", workMyBoardList);
			return "project/myProjBoard";
		}
		
		return goPage;
	}
	
	
}
