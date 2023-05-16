package kr.or.ddit.admin.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.admin.service.ComcodeService;
import kr.or.ddit.admin.service.ExpertService;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.member.vo.ExpertVO;

@Controller
@RequestMapping("/coco/admin")
public class ExpertPermissionContorller {

	@Inject
	private ExpertService expService;
	
	@Inject
	private ComcodeService codeService;
	
	@RequestMapping("/expApplyList")
	public String expApplyList(
					@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
					@RequestParam(value = "searchWord", required = false) String searchWord, 
					@RequestParam(value = "startPeriod", required = false) String startPeriod,
					@RequestParam(value = "endPeriod", required = false) String endPeriod,
					@RequestParam(value = "searchCode", required = false) String searchCode,
					Model model) {
		String comCodeGrp = "APPROVAL";
		List<ComCodeVO> codeList = codeService.callCodeList(comCodeGrp);
		
		PaginationInfoVO<ExpertVO> pagingVO = new PaginationInfoVO<ExpertVO>(9, 5);
		
		if(StringUtils.isNoneBlank(searchWord)) {
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
		int totalRecord = expService.countExpList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<ExpertVO> dataList = expService.selectExpList(pagingVO);
		pagingVO.setDataList(dataList);

		model.addAttribute("codeList", codeList);
		model.addAttribute("pagingVO", pagingVO);
		
		if (currentPage ==1) {
			model.addAttribute("start", totalRecord);
		} else {
			model.addAttribute("start", totalRecord - pagingVO.getScreenSize() * (currentPage -1));
		}
		return "admins/expApply/listExpApply";
	}
	
	@GetMapping("/expApplyDetail")
	public String expApplyDetail(String expFormNum, Model model) {
		ExpertVO expertVO = expService.selectExpform(expFormNum);
		
		model.addAttribute("expertVO", expertVO);
		return "admins/expApply/detailExpApply";
	}
	
	@RequestMapping("/registerExpert")
	public String registExpert(HttpServletRequest req, ExpertVO expertVO, Model model) {
		String goPage = "";
		HttpSession session = req.getSession();
		
		ServiceResult result = expService.registerExpert(req, expertVO);
		if (result.equals(ServiceResult.OK)) {
			goPage = "redirect:/coco/admin/expApplyList";
		} else {
			goPage = "redirect:/coco/admin/expApplyDetail?expFormNum=" + expertVO.getExpFormNum();
		}
		
		return goPage;
	}
	
	@PostMapping("/refuseExpert")
	public String refuseExpert(HttpServletRequest req, ExpertVO expertVO, Model model) {
		String goPage = "";
		HttpSession session = req.getSession();
		
		ServiceResult result = expService.refuseExpert(req, expertVO);
		if (result.equals(ServiceResult.OK)) {
			goPage = "redirect:/coco/admin/expApplyList";
		} else {
			goPage = "redirect:/coco/admin/expApplyDetail?expFormNum=" + expertVO.getExpFormNum();
		}
		
		return goPage;
	}
	
}
