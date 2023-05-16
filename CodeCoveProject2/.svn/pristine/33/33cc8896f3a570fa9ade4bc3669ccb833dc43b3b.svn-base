package kr.or.ddit.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.board.service.FreeBoardService;
import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.board.vo.FreeBoardVO;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.common.attatch.service.AttatchService;
import kr.or.ddit.member.vo.MemberVO;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {

	@Inject
	private FreeBoardService service;

	@Inject
	private AttatchService attachService;

	@RequestMapping("/list")
	public String boardList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchWord", required = false) String searchWord, Model model) {
		PaginationInfoVO<FreeBoardVO> pagingVO = new PaginationInfoVO<FreeBoardVO>(10, 5);

		if (StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		pagingVO.setCurrentPage(currentPage);
		List<FreeBoardVO> dataList = service.selectFreeBoList(pagingVO);
		pagingVO.setDataList(dataList);

		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.countFreeBoList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		model.addAttribute("pagingVO", pagingVO);
		if (currentPage == 1) {
			model.addAttribute("start", totalRecord);
		} else {
			model.addAttribute("start", totalRecord - pagingVO.getScreenSize() * (currentPage - 1));
		}
		return "board/freeBoard/list";
		
	}

	// 게시판 상세보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String boardDetail(Model model, String freeNum) {
		FreeBoardVO freeBoardVO = service.retrievePost(freeNum);
		model.addAttribute("freeBoardVO", freeBoardVO);
		return "board/freeBoard/read";
	}

	// 게시글 수정
	@RequestMapping(value = "{freeNum}/update", method = RequestMethod.GET)
	public String freeBoardUpdateView(@PathVariable("freeNum") String freeNum, Model model) {

		FreeBoardVO freeBoardVO = service.retrievePost(freeNum);
		service.retrievePost(freeNum);
		System.out.println(freeNum);
		model.addAttribute("freeBoardVO", freeBoardVO);
		return "board/freeBoard/modify";
	}

	@RequestMapping(value = "{freeNum}/update", method = RequestMethod.POST)
	public String freeBoardUpdate(HttpServletRequest req, @PathVariable("freeNum") String freeNum,
			@ModelAttribute("freeBoardVO") FreeBoardVO freeBoardVO,
			@RequestParam(value = "delAttatchNum", required = false) String[] delAttatchNum,
			@RequestParam(value = "delAttatchOrder", required = false) int[] delAttatchOrder, Errors error) {
		Map<String, Object> map = new HashMap<>();
		map.put("freeBoardVO", freeBoardVO);
		map.put("attatchNum", delAttatchNum);
		map.put("attatchOrder", delAttatchOrder);
		String gopage = "";

		if (!error.hasErrors()) {
			service.modifyFreeBoard(map);
			gopage = "redirect:/freeBoard/read";
		} else {
			gopage = "redirect:/freeBoard/update";
		}

		return gopage;
	}

	// 게시글 삭제
	@GetMapping("{freeNum}/delete")
	public String deleteBoard(@PathVariable("freeNum") String freeNum, Model model) {
		System.out.println("freeNum 넘어오는지 확인>> " + freeNum);
		service.deleteFreeBoard(freeNum);
		model.addAttribute("msg", "삭제가 완료되었습니다.");
		return "redirect:/freeBoard/list";
	}

}
