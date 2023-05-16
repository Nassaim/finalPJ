package kr.or.ddit.expert.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.expert.service.IMentoringService;
import kr.or.ddit.expert.vo.ExpertProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco/mentoring")
public class MentoringListContorller {

	@Inject
	private IMentoringService service;
	
	
	
	@RequestMapping("/category")
	public String mentoringCategory(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "eprodTag", required = false) String eprodTag,
			Model model) {
		
		PaginationInfoVO<ExpertProdVO> pagingVO = new PaginationInfoVO<ExpertProdVO>(10, 5);
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		if(StringUtils.isNotBlank(eprodTag)) {
			pagingVO.setEprodTag(eprodTag);
		}

		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.selectMentoringCategoryCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<ExpertProdVO> dataList = service.mentoringCategory(pagingVO);
		log.debug("dataList size" , dataList.size());
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		if(currentPage == 1){
			model.addAttribute("start", totalRecord);
		}else {
			model.addAttribute("start", totalRecord - pagingVO.getScreenSize() * (currentPage-1));
		}
		
		log.debug("totalRecord 몇갠데?"+totalRecord);
		return "solutions/mentoringList";
	}
}
