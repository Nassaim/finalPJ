package kr.or.ddit.blog.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.blog.service.BlogListService;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.member.vo.MemberVO;

@Controller
@RequestMapping("/blog")
public class BlogController {
	@Inject
	BlogListService blogService;

	public String blogMain() {
		return "blog/trend";
	}

	@GetMapping("trend")
	public String TrendList(HttpServletRequest req, RedirectAttributes ra, Model model) {
		
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");

		if (sessionMember == null) {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			return "redirect:/coco/login";
		}
		
		model.addAttribute("memId", sessionMember.getMemId());
		
		return "blog/trend";
	}

	@GetMapping("latest")
	public String latestList() {
		return "blog/latest";
	}

	@GetMapping("search")
	public String search() {
		return "blog/search";
	}

	@ResponseBody
	@GetMapping(value = "latestList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public PaginationInfoVO<MyBlogPostVO> getLatestList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage) {

		PaginationInfoVO<MyBlogPostVO> pagingVO = new PaginationInfoVO<>(6, 5);
		pagingVO.setCurrentPage(currentPage);
		blogService.retrieveLatestList(pagingVO);

		return pagingVO;
	}

	@ResponseBody
	@GetMapping(value = "trendList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<MyBlogPostVO> getTrendList() {

		List<MyBlogPostVO> trendList = blogService.retrieveTrendList();
		return trendList;
	}

	@ResponseBody
	@GetMapping(value = "searchList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public PaginationInfoVO<MyBlogPostVO> getSearchList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchWord", required = false) String searchWord) {

		PaginationInfoVO<MyBlogPostVO> pagingVO = new PaginationInfoVO<>(9, 5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSearchWord(searchWord);

		blogService.retrieveSearchList(pagingVO);

		return pagingVO;
	}

}
