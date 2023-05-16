package kr.or.ddit.expert.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.expert.service.ITemplateListService;
import kr.or.ddit.expert.vo.ExpertProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco/solution")
public class templateListController {
	
	@Inject
	private ITemplateListService service;
	
//	
//	@GetMapping("/category")
//	public String templateCategory(Model model, ExpertProdVO expProdVO) {
//		
//		List<ExpertProdVO> templateCategory = service.templateCategory(expProdVO);
//		log.debug("templateCategory 몇갠데?"+templateCategory.size());
//		model.addAttribute("templateCategory", templateCategory);
//		return "solutions/templateList";
//	}
	
//	@GetMapping("/category")
	@RequestMapping("/category")
	public String templateCategory(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "eprodTag", required = false) String eprodTag,
			@RequestParam(value = "eprodLangCode", required = false) String eprodLangCode,
			Model model) {
		
		PaginationInfoVO<ExpertProdVO> pagingVO = new PaginationInfoVO<ExpertProdVO>(9, 5);
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		if(StringUtils.isNotBlank(eprodTag)) {
			pagingVO.setEprodTag(eprodTag);
		}
		if(StringUtils.isNotBlank(eprodLangCode)) {
			pagingVO.setEprodLangCode(eprodLangCode);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.selectTemplateCategoryCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<ExpertProdVO> dataList = service.templateCategory(pagingVO);
		log.debug("dataList size" , dataList.size());
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		if(currentPage == 1){
			model.addAttribute("start", totalRecord);
		}else {
			model.addAttribute("start", totalRecord - pagingVO.getScreenSize() * (currentPage-1));
		}
		
		log.debug("totalRecord 몇갠데?"+totalRecord);
		return "solutions/templateList";
	}

}
