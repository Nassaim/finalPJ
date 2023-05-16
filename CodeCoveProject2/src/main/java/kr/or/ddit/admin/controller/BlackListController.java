package kr.or.ddit.admin.controller;

import java.util.List;
import javax.inject.Inject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.or.ddit.admin.service.BlackListService;
import kr.or.ddit.admin.service.ComcodeService;
import kr.or.ddit.admin.vo.BlackListVO;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.common.ReportVO;

@Controller
@RequestMapping("/coco/admin")
public class BlackListController {

	@Inject
	private BlackListService blackService;
	
	@Inject
	private ComcodeService codeService;
	
	@RequestMapping("/blacklist")
	public String RetrieveBlacklist(
					@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
					@RequestParam(value = "searchWord", required = false) String searchWord, 
					@RequestParam(value = "startPeriod", required = false) String startPeriod,
					@RequestParam(value = "endPeriod", required = false) String endPeriod,
					@RequestParam(value = "searchCode", required = false) String searchCode,
					Model model) {
		String comCodeGrp = "EXP_REPORT";
		List<ComCodeVO> codeList = codeService.callCodeList(comCodeGrp);
		PaginationInfoVO<ReportVO> pagingVO = new PaginationInfoVO<ReportVO>(10, 5);
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		if(StringUtils.isNotBlank(startPeriod) && StringUtils.isNotBlank(endPeriod)) {
			pagingVO.setStartPeriod(startPeriod);
			pagingVO.setEndPeriod(endPeriod);
			model.addAttribute("startPeriod", startPeriod);
			model.addAttribute("endPeriod", endPeriod);
		}
		
		if(StringUtils.isNotBlank(searchCode)) {
			pagingVO.setSearchCode(searchCode);
			model.addAttribute("searchCode", searchCode);
		}
		
		pagingVO.setCurrentPage(currentPage);
		List<ReportVO> dataList = blackService.selectBlackList(pagingVO);
		int totalRecord = dataList.size();
		pagingVO.setTotalRecord(totalRecord);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("codeList", codeList);
		model.addAttribute("pagingVO", pagingVO);
		
		if(currentPage == 1){
			model.addAttribute("start", totalRecord);
		}else {
			model.addAttribute("start", totalRecord - pagingVO.getScreenSize() * (currentPage-1));
		}
		return "admins/blacklist/ListBlacklist";
	}
	
	@PostMapping("/getTotalReport")
	public void getTotalReport(Model model) {
		BlackListVO totalReport = blackService.getTotalReport();
		model.addAttribute("totalReport", totalReport);
	}
	
}
