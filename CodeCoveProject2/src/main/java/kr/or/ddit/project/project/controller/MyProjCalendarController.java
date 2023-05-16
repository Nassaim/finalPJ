package kr.or.ddit.project.project.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.work.service.IWorkService;
import kr.or.ddit.project.work.vo.WorkVO;

@Controller
@RequestMapping("/coco/myCalendar")
public class MyProjCalendarController {
	
	@Inject
	private IWorkService workService;

	@RequestMapping(value="/form", method = RequestMethod.GET)
	public String myProjCalendar() {
		return "project/myProjCalendar";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public ResponseEntity<List<Map<String, Object>>> getMyProjCalendarList(HttpServletRequest req){
		System.out.println("여기로 이동!");
		
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		String loginId = sessionMember.getMemId();
		
		List<WorkVO> workMyCalList = workService.myCalList(loginId);
		List<Map<String, Object>> list = new ArrayList<>();
		
		for(int i=0; i < workMyCalList.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			map.put("pjId", workMyCalList.get(i).getPjId());
			map.put("pjName", workMyCalList.get(i).getPjName());
			map.put("workNum", workMyCalList.get(i).getWorkNum());
			map.put("title", workMyCalList.get(i).getWorkTitle());
			map.put("content", workMyCalList.get(i).getWorkContent());
			map.put("start", workMyCalList.get(i).getWorkStartDate());
			map.put("end", workMyCalList.get(i).getWorkEndDate());
			map.put("color", workMyCalList.get(i).getWorkColor());
			map.put("textColor", "black");
			list.add(map);
		}
		
		return new ResponseEntity<List<Map<String,Object>>>(list,HttpStatus.OK);
	}
}
