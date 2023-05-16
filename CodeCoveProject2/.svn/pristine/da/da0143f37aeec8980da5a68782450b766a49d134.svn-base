package kr.or.ddit.blog.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.blog.service.BlogWriteService;
import kr.or.ddit.blog.service.MyBlogService;
import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.BlogHeartVO;
import kr.or.ddit.blog.vo.PostMarkVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.member.vo.MemberVO;

@Controller
public class BookMarkController {

	@Inject
	BlogWriteService blogservice;

	@Inject
	MyBlogService myblogService;

//	사이드메뉴
	@ModelAttribute("blogCateList")
	public List<BlogCateVO> blogCateList(@PathVariable("memId") String memId) {

		List<BlogCateVO> blogCateList = myblogService.retrieveCate(memId);
		return blogCateList;
	}

	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE, value = "{memId}/savePostHeart", method = RequestMethod.POST)
	@ResponseBody
	public String savePostHeart(@PathVariable("memId") String memId, @RequestParam String postNum
			,HttpServletRequest req) {
		
		HttpSession session=req.getSession();
		MemberVO memberVO=(MemberVO) session.getAttribute("SessionInfo");
		String loginId=memberVO.getMemId();
		
		BlogHeartVO heart = new BlogHeartVO();
		heart.setMemId(loginId);
		heart.setPostNum(postNum);
		blogservice.createHeart(heart);

		blogservice.modifyHeartNo(postNum);

		return "{\"message\": \"추가.\"}";
	}

	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE, value = "{memId}/delPostHeart", method = RequestMethod.POST)
	@ResponseBody
	public String deletePostHeart(@PathVariable("memId") String memId, @RequestParam String postNum, Model model) {

		BlogHeartVO heart = new BlogHeartVO();
		heart.setMemId(memId);
		heart.setPostNum(postNum);
		blogservice.deleteHeart(heart);
		blogservice.modifyHeartNo(postNum);
		return "{\"message\": \"삭제.\"}";
	}

	@GetMapping("blog/{memId}/bookmark")
	public String postMarkList(@PathVariable("memId") String memId,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage, Model model) {

		PaginationInfoVO<PostMarkVO> pagingVO = new PaginationInfoVO<>(8, 5);
		PostMarkVO postmark = new PostMarkVO();
		postmark.setMemId(memId);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setDetailCondition(postmark);
		blogservice.retrieveMyMarkList(pagingVO);

		model.addAttribute("bookSize", pagingVO.getDataList().size());
		model.addAttribute("pagingVO", pagingVO);

		return "myblog/markList";
	}
}
