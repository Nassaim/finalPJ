package kr.or.ddit.project.project.controller;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.work.service.IWorkService;
import kr.or.ddit.project.work.vo.WorkVO;

@Controller
@RequestMapping("/coco/myGantt")
public class MyProjGanttController {
	
	@Inject
	private IWorkService workService;

	@RequestMapping(value="/form",method=RequestMethod.GET)
	public String myProjGantt(Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		String loginId = sessionMember.getMemId();
		
		List<WorkVO> workMyGanttList = workService.myCalList(loginId);
//		GanttData ganttData = transformTasksToGanttData(workMyGanttList);
		
		model.addAttribute("workMyGanttList",workMyGanttList);
		return "project/myProjGantt";
	}
	
	@RequestMapping(value="/list", method = RequestMethod.POST)
	public ResponseEntity<List<Map<String, Object>>> getMyProjGanttList(HttpServletRequest req){
		System.out.println("간트차트!!!!");
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		String loginId = sessionMember.getMemId();
		
		List<WorkVO> workMyGanttList = workService.myCalList(loginId);
		List<Map<String, Object>> list = new ArrayList<>();
		
		for(int i=0; i<workMyGanttList .size(); i++) {
			Map<String, Object>map = new HashMap<>();
			map.put("id", workMyGanttList.get(i).getWorkNum());
			map.put("text", workMyGanttList.get(i).getWorkTitle());
			map.put("start_date", workMyGanttList.get(i).getWorkStartDate());
			
//			map.put("end", workMyGanttList.get(i).getWorkEndDate());
			String startDateString = workMyGanttList.get(i).getWorkStartDate();
			LocalDate startDate = LocalDate.of(
			        Integer.parseInt(startDateString.substring(0, 4)),  // 연도 추출
			        Integer.parseInt(startDateString.substring(5, 7)),  // 월 추출
			        Integer.parseInt(startDateString.substring(8, 10))  // 일 추출
			);
			String EndDateString = workMyGanttList.get(i).getWorkEndDate();
			LocalDate endDate = LocalDate.of(
			        Integer.parseInt(EndDateString.substring(0, 4)),  // 연도 추출
			        Integer.parseInt(EndDateString.substring(5, 7)),  // 월 추출
			        Integer.parseInt(EndDateString.substring(8, 10))  // 일 추출
			);
			Period period = Period.between(startDate, endDate);
			map.put("duration", period.getDays());
			
			int pg = Integer.parseInt(workMyGanttList.get(i).getWorkProgress());
			double doupg = pg/100.0;
			map.put("progress", doupg);
			list.add(map);
		}
		System.out.println("간트차트 데이터"+list);
		
		return new ResponseEntity<List<Map<String,Object>>>(list,HttpStatus.OK);
	}
	
}
