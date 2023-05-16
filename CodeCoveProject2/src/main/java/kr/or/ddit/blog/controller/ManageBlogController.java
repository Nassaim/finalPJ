package kr.or.ddit.blog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.blog.service.ManageService;
import kr.or.ddit.blog.service.MyBlogService;
import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.BlogReplyVO;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.member.vo.MemberPrincipal;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/blog")
public class ManageBlogController {

	@Inject
	ManageService manageService;

	@GetMapping("{memId}/manage")
	public String manage(@PathVariable(value = "memId") String memId, Model model) {
		model.addAttribute("memId", memId);
		return "blogManage/blogManage";
	}

	@GetMapping("blogManage/check")
	public String checkPage(Model model) {
		model.addAttribute("check", "check");
		return "blogManage/check";
	}

	// 블로그 관리 홈, 맨처음 시작 카테고리
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE, value = "{memId}/blogManage", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> blogManage(@PathVariable("memId") String memId,
			@RequestParam(name = "catePage", required = false, defaultValue = "1") int catePage,
			@RequestParam(value = "searchWord", required = false) String searchWord) {
		String viewName = null;
		Map<String, Object> retMap = new HashMap<>();
//		인증 구현 필요
//		if (SecurityContextHolder.getContext().getAuthentication().isAuthenticated()
//				&& !SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
//			MemberVO mv = ((MemberPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal())
//					.getRealMember();
//
//			if (memId.equals(mv.getMemId())) {
//				PaginationInfoVO<BlogCateVO> catePagingVO = new PaginationInfoVO<>(6, 5);
//				catePagingVO.setCurrentPage(catePage);
//				catePagingVO.setSearchWord(searchWord);
//
//				catePagingVO.setDetailCondition(new BlogCateVO());
//				catePagingVO.getDetailCondition().setBloggerId(memId);
//				manageService.retrieveJsonCate(catePagingVO);
//
//				retMap.put("catePagingVO", catePagingVO);
//			} else {
//				viewName = "blogManage/check";
//				retMap.put("checkurl", viewName);
//
//			}
//		} else {
//			viewName = "redirect:/login";
//			retMap.put("loginurl", "/login");
//		}
		PaginationInfoVO<BlogCateVO> catePagingVO = new PaginationInfoVO<>(6, 5);
		catePagingVO.setCurrentPage(catePage);
		catePagingVO.setSearchWord(searchWord);

		catePagingVO.setDetailCondition(new BlogCateVO());
		catePagingVO.getDetailCondition().setBloggerId(memId);
		manageService.retrieveJsonCate(catePagingVO);

		retMap.put("catePagingVO", catePagingVO);
		
		return retMap;

	}

	// 카테고리 추가
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE, value = "{memId}/create", method = RequestMethod.GET)
	@ResponseBody
	public String createCate(@RequestParam(value = "inputData", required = false) String inputData,
			@PathVariable("memId") String memId) {
		log.info("createNm:{}", inputData);
		String check = null;
		if (StringUtils.isEmpty(inputData)) {
			check = "{\"check\": \"누락\"}";
		} else {
			int cnt = manageService.createCateNm(inputData, memId);
			if (cnt > 0) {
				check = "{\"check\": \"추가\"}";
			} else {
				check = "{\"check\": \"중복\"}";
			}
		}
		return check;
	}

	// 카레고리 수정
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE, value = "{memId}/upName", method = RequestMethod.GET)
	@ResponseBody
	public String updateCate(@RequestParam(value = "updateNm[]") List<String> updateNm,
			@PathVariable("memId") String memId) {

		log.info("카테넘:{}", updateNm);
		Map<String, String> updateMap = new HashMap<>();
		updateMap.put("upName", updateNm.get(0));
		updateMap.put("cateNum", updateNm.get(1));
		updateMap.put("memId", memId);
		String msg = null;
		if (updateNm.size() != 2) {
			msg = "{\"msg\": \"입력값이 누락되었습니다.\"}";
		} else {
			int cnt = manageService.modifyCateNm(updateMap);
			if (cnt > 0) {
				msg = "{\"msg\": \"수정되었습니다.\"}";
			} else {
				msg = "{\"msg\": \"카테고리가 이미 존재합니다.\"}";
			}
		}
		return msg;
	}

	// 카테고리 삭제
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE, value = "{memId}/delNum", method = RequestMethod.GET)
	@ResponseBody
	public String deleteCate(@RequestParam(value = "delNum") String delNum) {
		String msg = null;
		int cnt = manageService.removeCateNm(delNum);
		if (cnt > 0) {
			msg = "{\"msg\": \"삭제되었습니다.\"}";
		} else {
			msg = "{\"msg\": \"삭제실패. 다시시도해주세요\"}";
		}
		return msg;
	}

	// 게시글 관리
	@GetMapping("{memId}/postManage")
	public String postManage(Model model, @PathVariable(value = "memId") String memId) {
		model.addAttribute("memId", memId);
		return "blogManage/postManage";
	}

	// 게시글 불러오기
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE, value = "{memId}/getPost", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> postList(@PathVariable(value = "memId") String memId,
			@RequestParam(name = "postPage", required = false, defaultValue = "1") int postPage,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "searchType", required = false) String searchType) {
		String viewName = null;
		Map<String, Object> retMap = new HashMap<>();
//		인증 구현 필요
//		if (SecurityContextHolder.getContext().getAuthentication().isAuthenticated()
//				&& !SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
//			MemberVO mv = ((MemberPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal())
//					.getRealMember();
//
//			if (memId.equals(mv.getMemId())) {
//				PaginationInfoVO<MyBlogPostVO> postPagingVO = new PaginationInfoVO<>(5, 5);
//				postPagingVO.setCurrentPage(postPage);
//				postPagingVO.setDetailCondition(new MyBlogPostVO());
//				postPagingVO.getDetailCondition().setBloggerId(mv.getMemId());
//				
//				postPagingVO.setSearchType(searchType);
//				postPagingVO.setSearchWord(searchWord);
//
//				manageService.retrievePostList(postPagingVO);
//				retMap.put("postPagingVO", postPagingVO);
//			} else {
//				viewName = "blogManage/check";
//				retMap.put("checkurl", viewName);
//
//			}
//		} else {
//			viewName = "redirect:/login";
//			retMap.put("loginurl", "/login");
//		}
		PaginationInfoVO<MyBlogPostVO> postPagingVO = new PaginationInfoVO<>(5, 5);
		postPagingVO.setCurrentPage(postPage);
		postPagingVO.setDetailCondition(new MyBlogPostVO());
		postPagingVO.getDetailCondition().setBloggerId(memId);
		
		postPagingVO.setSearchType(searchType);
		postPagingVO.setSearchWord(searchWord);

		manageService.retrievePostList(postPagingVO);
		retMap.put("postPagingVO", postPagingVO);

		return retMap;
	}

	// 게시글 삭제
	@RequestMapping(value = "{memId}/delPost", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String postDelete(@RequestParam(value = "postBoxArr[]") List<String> postBoxArr) {
		MyBlogPostVO myblogPostVO = new MyBlogPostVO();
		myblogPostVO.setPostNumList(postBoxArr);
		String msg = manageService.removePost(myblogPostVO);
		return msg;
	}

	// 댓글관리
	@GetMapping("{memId}/replyManage")
	public String replyManage(Model model, @PathVariable(value = "memId") String memId) {
		model.addAttribute("memId", memId);
		return "blogManage/replyManage";
	}

	// 댓글 리스트
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE, value = "{memId}/getReply", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> replyList(@PathVariable(value = "memId") String memId,
			@RequestParam(name = "replyPage", required = false, defaultValue = "1") int replyPage,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "searchType", required = false) String searchType) {
		String viewName = null;
		Map<String, Object> retMap = new HashMap<>();
//		인증 구현 필요
//		if (SecurityContextHolder.getContext().getAuthentication().isAuthenticated()
//				&& !SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
//			MemberVO mv = ((MemberPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal())
//					.getRealMember();
//
//			if (memId.equals(mv.getMemId())) {
//				PaginationInfoVO<BlogReplyVO> replyPagingVO = new PaginationInfoVO<>(5, 5);
//				replyPagingVO.setCurrentPage(replyPage);
//				replyPagingVO.setDetailCondition(new BlogReplyVO());
//				replyPagingVO.getDetailCondition().setBlReplyWriter(mv.getMemId());
//				replyPagingVO.setSearchType(searchType);
//				replyPagingVO.setSearchWord(searchWord);
//
//				manageService.retrieveReplyList(replyPagingVO);
//				retMap.put("replyPagingVO", replyPagingVO);
//			} else {
//				viewName = "blogManage/check";
//				retMap.put("checkurl", viewName);
//
//			}
//		} else {
//			viewName = "redirect:/login";
//			retMap.put("loginurl", "/login");
//		}
		
		PaginationInfoVO<BlogReplyVO> replyPagingVO = new PaginationInfoVO<>(5, 5);
		replyPagingVO.setCurrentPage(replyPage);
		replyPagingVO.setDetailCondition(new BlogReplyVO());
		replyPagingVO.getDetailCondition().setBlReplyWriter(memId);
		replyPagingVO.setSearchType(searchType);
		replyPagingVO.setSearchWord(searchWord);

		manageService.retrieveReplyList(replyPagingVO);
		retMap.put("replyPagingVO", replyPagingVO);

		return retMap;
	}

	// 댓글삭제
	@RequestMapping(value = "{memId}/delReply", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String replyDelete(@RequestParam(value = "replyBoxArr[]") List<String> replyBoxArr) {
		BlogReplyVO blogReplyVO = new BlogReplyVO();
		blogReplyVO.setBlReplyNumList(replyBoxArr);
		String msg = manageService.removeReply(blogReplyVO);
		return msg;
	}
}
