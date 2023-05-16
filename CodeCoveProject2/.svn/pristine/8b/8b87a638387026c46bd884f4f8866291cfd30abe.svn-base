package kr.or.ddit.admin.controller;

import java.util.List;
import javax.inject.Inject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.or.ddit.admin.service.ComcodeService;
import kr.or.ddit.admin.service.MemberManagementService;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.member.vo.MemberVO;

@Controller
@RequestMapping("/coco/admin")
public class MemberManagementContorller {
	
	@Inject
	private MemberManagementService memberService;

	@RequestMapping("/main")
	public String allMemberList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			Model model) {
		PaginationInfoVO<MemberVO> pagingVO = new PaginationInfoVO<MemberVO>(13, 5);
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		List<MemberVO> dataList = memberService.selectAllMemberList(pagingVO);
		int totalRecord = dataList.size();
		pagingVO.setTotalRecord(totalRecord);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		if(currentPage == 1){
			model.addAttribute("start", totalRecord);
		}else {
			model.addAttribute("start", totalRecord - pagingVO.getScreenSize() * (currentPage-1));
		}
		return "admins/memberManagement/ListMember";
	}
	
	
}
