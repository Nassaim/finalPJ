package kr.or.ddit.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.expert.vo.MyExpertVO;
import kr.or.ddit.member.service.IMemberChart;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMypageService;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.MyChartVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco") 
public class ChartController {
	
	@Inject
	private IMemberService memService;
	
	@Inject
	private IMemberChart chartService;
	

	@RequestMapping(value = "/myChart", method = RequestMethod.GET)
	public String chartForm(HttpServletRequest req, MyChartVO chartVO, Model model) {
		
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		String expertId = sessionMember.getMemId();
		
		
		List<MyExpertVO> sellRecordList = chartService.totalSellList(expertId); // 판매내역 리스트
		log.debug("판매내역>> {} : " + sellRecordList);
		
		MyExpertVO topMonth = chartService.selectTopResult(expertId); // 이번달 총 판매액
		MyExpertVO lastMonth = chartService.selectLastTopResult(expertId); // 저번달 총 판매액
		MyExpertVO topLike = chartService.selectTopLike(expertId); // 최다북마크
		MyExpertVO topReview = chartService.selectTopReview(expertId); // 최다리뷰
		
//		log.info("월 >> " + topMonth.getTotalMonth() + "합계 >> " + topMonth.getTotalSum());
		model.addAttribute("memId", expertId);
		model.addAttribute("list", sellRecordList);
		
		model.addAttribute("topMonth", topMonth); // 이번달 총 판매액
		model.addAttribute("lastMonth", lastMonth); // 저번달 총 판매액
		model.addAttribute("topLike", topLike);  // 최다북마크
		model.addAttribute("topReview", topReview);  // 최다리뷰
		
		System.out.println("트");
		return "member/myChart";
	}	
	
	
	@ResponseBody
	@RequestMapping(value = "/chartYearAjax", method = RequestMethod.POST)
	public String charYear(HttpServletRequest req, @RequestBody MyChartVO chartVO, Model model) {
		
		List<MyChartVO> chartList = chartService.selectYearProfie(chartVO);

		log.info("차트리스트 사이즈 확인>> ", chartList.size());
		log.info("차트리스트 달  확인>> ", chartList.get(0).getChMonth() + ", 차트리스트 토탈 amount >> " + chartList.get(0).getChMonthSum());
		
		ObjectMapper mapper = new ObjectMapper();
		String json = "";
		
		try {
			json = mapper.writeValueAsString(chartList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return json;
	}	

	@ResponseBody
	@RequestMapping(value = "/chartCateAjax", method = RequestMethod.POST)
	public String charCategory(HttpServletRequest req, @RequestBody MyChartVO chartVO) {
		
		List<MyChartVO> chartList = chartService.selectCategoryProfit(chartVO);
		
		log.info("차트리스트 사이즈 확인>> "+ chartList.size());
		log.info("차트리스트 달  확인>> "+ chartList.get(0).getChMonth() + ", 차트리스트 토탈 amount >> " + chartList.get(0).getChMonthSum());
		
		System.out.println("제발제발작동해줘 >>" + chartList.get(0).getChMonth() + " , " + chartList.get(0).getChMonthSum());
		
		ObjectMapper mapper = new ObjectMapper();
		String json = "";
		
		
		try {
			json = mapper.writeValueAsString(chartList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return json;
	}	
	
//	
//	@ResponseBody
//	@RequestMapping(value = "/chartCateAjax", method = RequestMethod.POST)
//	public MyChartVO chartTopAjax(HttpServletRequest req, @RequestBody MyChartVO chartVO) {
//		
//		// 쿼리만넣기 
//		MyChartVO chartResult = chartService.selectTopResult(chartVO);
//		
//		return chartResult;
//	}	
	
	

}
