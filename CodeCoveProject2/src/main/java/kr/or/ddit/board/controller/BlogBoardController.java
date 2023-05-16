package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.blog.service.BlogReplyService;
import kr.or.ddit.blog.service.BlogWriteService;
import kr.or.ddit.blog.service.MyBlogService;
import kr.or.ddit.blog.vo.BlogHeartVO;
import kr.or.ddit.blog.vo.BlogReplyVO;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.board.service.BlogBoardService;
import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.common.ReportVO;
import kr.or.ddit.common.report.ReportService;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/coco/blogBoard")
public class BlogBoardController {
	@Inject
	MyBlogService blogService;
	
	@Inject
	private BlogBoardService blBoService;
	
	@Inject
	BlogWriteService writeService;
	
	@Inject
	BlogReplyService replyService;
	
	@Inject
	ReportService repService;
	
	@RequestMapping("/list")
	public String blogList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			Model model, String postPublicYn, String postDelYn) {
		PaginationInfoVO<MyBlogPostVO> pagingVO=new PaginationInfoVO<MyBlogPostVO>(9,5);
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		pagingVO.setCurrentPage(currentPage);
		List<MyBlogPostVO> dataList=blBoService.selectBlBoList(pagingVO);
		pagingVO.setDataList(dataList);
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = blBoService.countBlBoList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingVO", pagingVO);
		if(currentPage ==1) {
			model.addAttribute("start", totalRecord);
		}else {
			model.addAttribute("start", totalRecord - pagingVO.getScreenSize()*(currentPage-1));
		}
		
//		PaginationInfoVO<MyBlogPostVO> pagingVO = new PaginationInfoVO<MyBlogPostVO>(12, 5);
		MyBlogPostVO myBlogPostVO = new MyBlogPostVO();
		myBlogPostVO.setPostPublicYn(postPublicYn);
//		pagingVO.setCurrentPage(currentPage);
//		pagingVO.setDetailCondition(myBlogPostVO);
		blBoService.publicBoardList(postPublicYn, postDelYn);
//		
		List<MyBlogPostVO> myBlogPostVOList= blBoService.publicBoardList(postPublicYn,postDelYn);
		log.debug("myBlogPostList:   "+myBlogPostVOList);
		model.addAttribute("myBlogPostList", myBlogPostVOList);
//		
		
		return "board/blogBoard/list";
	}
	
	@GetMapping("/read/{memId}/{postNum}") // 경로 변수를 경로에 포함시킴
	public String publicBoard(@PathVariable("memId") String memId, @PathVariable("postNum") String postNum,
	    Model model,HttpServletRequest req, Authentication auth, HttpServletResponse resp,RedirectAttributes ra) throws IOException {

		String viewName = null;
		MyBlogPostVO post = blogService.retrievePost(memId, postNum);
		int heartNo = writeService.countHeart(postNum);
		MemberVO member = null;

		HttpSession session=req.getSession();
		MemberVO memberVO=(MemberVO) session.getAttribute("SessionInfo");
		
		if (memberVO == null) {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			return "redirect:/coco/login";
		}
		
		String loginId=memberVO.getMemId();
		
		model.addAttribute("loginId", loginId);
		
		String postTag = post.getPostTag();
		if (postTag != null) {
			String[] TagArr = postTag.split(",");
			model.addAttribute("TagArr", TagArr);
		} else {
			model.addAttribute("TagArr", "");
		}

		// 일단인증없이
		BlogHeartVO heart = new BlogHeartVO();
		heart.setMemId(memId);
		heart.setPostNum(postNum);
		boolean Heartchk = writeService.heartYn(heart);
		System.out.println("Heartchk"+ Heartchk);
		model.addAttribute("post", post);
		model.addAttribute("Heartchk", Heartchk);
		model.addAttribute("heartNo", heartNo);
		viewName = "myblog/postView";
		
		return "board/blogBoard/readPubBoard";
	}
	@PostMapping("/reportInsert")
	public String reportInsert(ReportVO reportVO,Model model) {
		String goPage="";
		
		model.addAttribute("reportVO", reportVO);
		repService.reportInsert(reportVO);
		return goPage;
		
	}
	
	


}
