package kr.or.ddit.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.or.ddit.admin.service.StatisticsService;
import kr.or.ddit.admin.vo.StatisticsVO;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import oracle.sql.CHAR;

@Slf4j
@Controller
@RequestMapping("/coco/admin")
public class StatisticsController {

	@Inject
	public StatisticsService service;
	
	@RequestMapping("/statistics")
	public String ShowChart(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
	
		return "admins/statistics/chartMain";
	}
	
	
//	@ResponseBody
//	@RequestMapping(value = "/getCategoryData", method = RequestMethod.GET, produces = "application/json")
//	public Map<String, Object> getCategoryData(@RequestParam(value = "categories", required = false) String[] categories) {
//
//	    List<StatisticsVO> chartList;
//	    if (categories == null || categories.length == 0) {
//	        chartList = service.getCateData();
//	    } else {
//	        chartList = service.getCateDataByCategories(categories);
//	    }
//
//	    // 빈 JSONObject와 JSONArray 생성
//	    JSONObject chartData = new JSONObject();
//	    JSONArray datasetsArray = new JSONArray();
//	    
//	    // 데이터를 카테고리별로 그룹화
//	    Map<String, List<StatisticsVO>> groupedData = new HashMap<>();
//	    for (StatisticsVO data : chartList) {
//	        String category = data.getChCate();
//	        if (!groupedData.containsKey(category)) {
//	            groupedData.put(category, new ArrayList<>());
//	        }
//	        groupedData.get(category).add(data);
//	    }
//
//	    // 각 카테고리별로 JSONObject와 JSONArray 생성 후 datasetsArray에 추가
//	    for (String category : groupedData.keySet()) {
//	        JSONObject datasetsObj = new JSONObject();
//	        datasetsObj.put("label", category);
//	        JSONArray datasetsArr = new JSONArray(); 
//	        for (StatisticsVO data : groupedData.get(category)) {
//	            datasetsArr.add(data.getChPrice()); 
//	        }
//	        datasetsObj.put("data", datasetsArr);
//	        datasetsArray.add(datasetsObj);
//	    }
//
//	    // chartData에 결과값 저장
//	    chartData.put("data", datasetsArray);
//	    
//	    return chartData;
//	}


	@ResponseBody
	@RequestMapping(value = "/getYearCateData", method = RequestMethod.GET, produces = "application/json")
	public Map<String, Object> getYearCateData() {
		
	    List<StatisticsVO> chartList = service.getYearCateData();
	    System.out.println("차트! " + chartList.toString());

	    // 빈 JSONObject와 JSONArray 생성
	    JSONObject chartData = new JSONObject();
	    JSONArray datasetsArray = new JSONArray();
	    
	    // 데이터를 카테고리별로 그룹화
	    Map<String, List<StatisticsVO>> groupedData = new HashMap<>();
	    for (StatisticsVO data : service.getYearCateData()) {
	        String category = data.getChCate();
	        if (!groupedData.containsKey(category)) {
	            groupedData.put(category, new ArrayList<>());
	        }
	        groupedData.get(category).add(data);
	    }

	    // 각 카테고리별로 JSONObject와 JSONArray 생성 후 datasetsArray에 추가
	    for (String category : groupedData.keySet()) {
	        JSONObject datasetsObj = new JSONObject();
	        datasetsObj.put("label", category);
	        JSONArray datasetsArr = new JSONArray(); 
	        for (StatisticsVO data : groupedData.get(category)) {
	            datasetsArr.add(data.getChPrice()); 
	        }
	        datasetsObj.put("data", datasetsArr);
	        datasetsArray.add(datasetsObj);
	    }

	    // chartData에 결과값 저장
	    chartData.put("data", datasetsArray);
	    
	    String jsonString = chartData.toJSONString();

	    return chartData;
	}
	 
	
	@ResponseBody
	@RequestMapping(value = "/getCateSumData", method = RequestMethod.POST, produces = "application/json")
	public Map<String, Object> getCateSumData(@RequestParam("selectYear") String selectYear){
		Map<String, Object> chartData = new HashMap<>();
	    List<StatisticsVO> chartList = service.getCateSumData();
	    
	    log.info("selectYear" + selectYear);

	    JSONArray datasets = new JSONArray();
	    JSONObject inDataObj = new JSONObject();
	    for (int i = 0; i < chartList.size(); i++) {
			StatisticsVO statisticsVO = chartList.get(i);
			
			JSONArray indataArray = new JSONArray();
			indataArray.add(statisticsVO.getChPrice());
			
			datasets.add(indataArray);
		}
	    
	    JSONArray labels = new JSONArray();
	    labels.addAll(Arrays.asList("템플릿", "솔루션", "프리미엄서비스"));

	    chartData.put("labels", labels);
	    chartData.put("datasets", datasets);

	    return chartData;
	}
}









