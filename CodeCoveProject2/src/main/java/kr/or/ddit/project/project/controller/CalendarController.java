package kr.or.ddit.project.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.project.work.service.IWorkService;
import kr.or.ddit.project.work.vo.WorkVO;

@Controller
@RequestMapping("/coco/calendar")
public class CalendarController {
	
	@Inject
	private IWorkService workService;

	@RequestMapping(value="/list", method=RequestMethod.POST)
	public ResponseEntity<List<Map<String, Object>>> getMyCalLJsonList(String pjId){
		List<WorkVO> workCalList = workService.list(pjId);
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		for(int i=0; i < workCalList.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			map.put("num", workCalList.get(i).getWorkNum());
			map.put("title", workCalList.get(i).getWorkTitle());
			map.put("content", workCalList.get(i).getWorkContent());
			map.put("start", workCalList.get(i).getWorkStartDate());
			map.put("end", workCalList.get(i).getWorkEndDate());
			map.put("color", workCalList.get(i).getWorkColor());
			map.put("textColor", "black");
			list.add(map);
		}
		return new ResponseEntity<List<Map<String,Object>>>(list,HttpStatus.OK);
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public ResponseEntity<String> calendarWorkUpdate(WorkVO work){
		System.out.println("여길 못오네?");
		System.out.println(work.getWorkNum());
		System.out.println(work.getWorkTitle());
		System.out.println(work.getWorkStartDate());
		System.out.println(work.getWorkColor());
		workService.calendarWorkModify(work);
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
}
