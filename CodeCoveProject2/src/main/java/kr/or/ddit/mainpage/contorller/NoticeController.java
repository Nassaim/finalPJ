package kr.or.ddit.mainpage.contorller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.or.ddit.admin.service.ComcodeService;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mainpage.service.NoticeService;
import kr.or.ddit.mainpage.vo.NoticeVO;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco")
public class NoticeController {
	
	@Inject
	private NoticeService noticeService;
	
	@RequestMapping("/noticeRetrieve")
	public String viewNoticeList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchWord", required = false) String searchWord, Model model) {
		PaginationInfoVO<NoticeVO> pagingVO = new PaginationInfoVO<NoticeVO>(10, 5);
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		List<NoticeVO> dataList = noticeService.selectNoticeList(pagingVO); 
		int totalRecord = dataList.size();
		pagingVO.setTotalRecord(totalRecord);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		if(currentPage == 1){
			model.addAttribute("start", totalRecord);
		}else {
			model.addAttribute("start", totalRecord - pagingVO.getScreenSize() * (currentPage-1));
		}
		return "mainpages/notice/ListNotice";
	}
	
	@RequestMapping("/readNotice")
	public String ReadNotice(String notiNum, Model model) {
		NoticeVO noticeVO = noticeService.readNotice(notiNum);
		
		model.addAttribute("noticeVO", noticeVO);
		return "mainpages/notice/ReadNotice";
	}
	
	@GetMapping("/registerNoticeForm")
	public String RegisterNoticeForm() {
		return "mainpages/notice/formNotice";
	}
	
	@PostMapping("/registerNotice")
	public String RegisterNotice(HttpServletRequest req, @ModelAttribute("noticeVO") NoticeVO noticeVO, Model model) {
		String goPage = "";
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO)session.getAttribute("SessionInfo");
		
		if(sessionMember == null) {
			goPage = "redirect:/coco/login";
		} else {
			noticeVO.setWriterId(sessionMember.getMemId());
			int cnt = noticeService.registerNotice(noticeVO);
			if(cnt > 0) {
				goPage = "redirect:/coco/noticeRetrieve" ;
			} else {
				goPage = "redirect:/coco/registerNoticeForm";
				model.addAttribute("noticeVO", noticeVO);
			}
		}
		
		return goPage;
	}
	
	
}
