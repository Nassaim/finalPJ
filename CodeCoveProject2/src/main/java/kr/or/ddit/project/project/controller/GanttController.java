package kr.or.ddit.project.project.controller;

import java.time.LocalDate;
import java.time.Period;
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
@RequestMapping("/coco/gantt")
public class GanttController {
	
	@Inject
	private IWorkService workService;

	@RequestMapping(value="/list", method=RequestMethod.POST)
	public ResponseEntity<List<Map<String, Object>>> getGanttList(String pjId){
		List<WorkVO> workGanttList = workService.list(pjId);
		List<Map<String, Object>> list = new ArrayList<>();
		
		for(int i=0; i<workGanttList .size(); i++) {
			Map<String, Object>map = new HashMap<>();
			map.put("id", workGanttList.get(i).getWorkNum());
			map.put("text", workGanttList.get(i).getWorkTitle());
			map.put("start_date", workGanttList.get(i).getWorkStartDate());
			
			String startDateString = workGanttList.get(i).getWorkStartDate();
			LocalDate startDate = LocalDate.of(
			        Integer.parseInt(startDateString.substring(0, 4)),  // 연도 추출
			        Integer.parseInt(startDateString.substring(5, 7)),  // 월 추출
			        Integer.parseInt(startDateString.substring(8, 10))  // 일 추출
			);
			String EndDateString = workGanttList.get(i).getWorkEndDate();
			LocalDate endDate = LocalDate.of(
			        Integer.parseInt(EndDateString.substring(0, 4)),  // 연도 추출
			        Integer.parseInt(EndDateString.substring(5, 7)),  // 월 추출
			        Integer.parseInt(EndDateString.substring(8, 10))  // 일 추출
			);
			Period period = Period.between(startDate, endDate);
			map.put("duration", period.getDays());
			
			int pg = Integer.parseInt(workGanttList.get(i).getWorkProgress());
			double doupg = pg/100.0;
			map.put("progress", doupg);
			list.add(map);
		}
		
		return new ResponseEntity<List<Map<String,Object>>>(list,HttpStatus.OK);
	}
}
