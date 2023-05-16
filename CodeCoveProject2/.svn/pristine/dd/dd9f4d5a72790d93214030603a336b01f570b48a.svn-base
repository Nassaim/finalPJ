package kr.or.ddit.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.annotation.MultipartConfig;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.blog.service.BlogWriteService;
import kr.or.ddit.blog.service.MyBlogService;
import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/blog")
@MultipartConfig
public class BlogWriteController {

	@Inject
	BlogWriteService blogService;

	@Inject
	MyBlogService myblogService;
	
//	사이드메뉴
	@ModelAttribute("blogCateList")
	public List<BlogCateVO> blogCateList(@PathVariable("memId") String memId) {

		List<BlogCateVO> blogCateList = myblogService.retrieveCate(memId);
		return blogCateList;
	}

	public boolean checkMember(String memId, Model model) {
		boolean result = false;
		int cnt = myblogService.checkMemId(memId);
		if (cnt == 0) {
			model.addAttribute("check", "check");
			result = true;
		}
		return result;
	}

	@GetMapping("{memId}/post")
	public String WriteForm(@PathVariable("memId") String memId, Model model) {

		MyBlogPostVO mypost = new MyBlogPostVO();
		mypost.setBloggerId(memId);
		List<BlogCateVO> category = myblogService.retrieveCate(memId);
		model.addAttribute("mypost", mypost);
		model.addAttribute("category", category);
		return "myblog/wirteForm";
	}

	@PostMapping("{memId}/post")
	public String WirteProcess(@PathVariable("memId") String memId, @ModelAttribute("mypost") MyBlogPostVO mypost,
			Errors error) {
		String viewName = "";
		String thumbnail = mypost.getThumbnail();

		if (thumbnail.isEmpty()) {
			mypost.setThumbnail("/resources/images/noImg.png");
		}

		if (!error.hasErrors()) {
			blogService.createMypost(mypost);
			viewName = "redirect:/blog/{memId}";
			log.info(mypost.getPostContent());
		} else {

			viewName = "redirect:/blog/{memId}/post";
		}

		return viewName;
	}

	// 게시글 수정
	@GetMapping("{memId}/post/{postNum}/form")
	public String modifyPost(@PathVariable("memId") String memId, @PathVariable("postNum") String postNum,
			Model model) {

		MyBlogPostVO mypost = myblogService.retrievePost(memId, postNum);
		log.info("mypost:{}", mypost.getAttatchList());
		List<BlogCateVO> category = myblogService.retrieveCate(memId);
		model.addAttribute("mypost", mypost);

		model.addAttribute("category", category);

		return "myblog/updateForm";
	}

	@PostMapping("{memId}/post/{postNum}/form")
	public String modifyProcess(@PathVariable("memId") String memId, @PathVariable("postNum") String postNum,
			@ModelAttribute("mypost") MyBlogPostVO mypost,
			@RequestParam(value = "delAttatchNum", required = false) String[] delAttatchNum,
			@RequestParam(value = "delAttatchOrder", required = false) int[] delAttatchOrder, Errors error) {

		Map<String, Object> map = new HashMap<>();
		map.put("mypost", mypost);
		map.put("attatchNum", delAttatchNum);
		map.put("attatchOrder", delAttatchOrder);
		String thumbnail = mypost.getThumbnail();
		String viewName = "";
		
		if (thumbnail.isEmpty()) {
			mypost.setThumbnail("/resources/images/noImg.png");
		}
		if (!error.hasErrors()) {
			blogService.modifyPost(map);
			viewName = "redirect:/blog/{memId}/post/{postNum}";
		} else {
			viewName = "redirect:/blog/{memId}/post/{postNum}/form";
		}

		return viewName;
	}

	// 파일 다운로드 구현 필요
	@ResponseBody
	@GetMapping("{memId}/post/{postNum}/down")
	public void downloadExcel(@RequestParam(name = "attnum") String attnum,
			@RequestParam(name = "attorder") String attorder) {

	}

}