package kr.or.ddit.board.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.board.service.CooBoardService;
import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.board.vo.CooFormVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.project.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("coco/cooBoard")
public class cooBoardController {

	@Inject
	private CooBoardService service;
	
	@Inject
	private IMemberService memberService;

	@RequestMapping("/list")
	public String cooBoardList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchWord", required = false) String searchWord,Model model
			) {
		
//		CooBoardVO cooBoardVO=service.retrievePost(cooNm);
//		int memberCnt = service.memberCount(cooBoardVO.getPjId());
//		model.addAttribute("memberCnt", memberCnt);//협업 참가 인원 수
		
				
		PaginationInfoVO<CooBoardVO> pagingVO=new PaginationInfoVO<CooBoardVO>(10,5);
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		pagingVO.setCurrentPage(currentPage);
		List<CooBoardVO> dataList=service.selectPjBoList(pagingVO);
		pagingVO.setDataList(dataList);
		
		
		int totalRecord = service.countCoBoList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingVO", pagingVO);
		if(currentPage ==1) {
			model.addAttribute("start", totalRecord);
		}else {
			model.addAttribute("start", totalRecord - pagingVO.getScreenSize()*(currentPage-1));
		}
		return "board/cooBoard/list";
		
	}

	@GetMapping("/read")
	public String cooBoardDetail(Model model, String cooNm,HttpServletRequest req, RedirectAttributes ra) {
		log.debug("cooNm:  "+cooNm);
		
		CooBoardVO cooBoardVO=service.retrievePost(cooNm);
		
		int memberCnt = service.memberCount(cooBoardVO.getPjId());
		
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("SessionInfo"); // 글쓰는사람의 아이디
		
		if (memberVO == null) {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			return "redirect:/coco/login";
		}
		
		String memId = memberVO.getMemId();

		MemberVO member = memberService.selectMember(memberVO); // 회원정보 가져오기
		
		
		model.addAttribute("memberCnt", memberCnt);
		model.addAttribute("memId", memId);
		model.addAttribute("memberVO", member);
		model.addAttribute("cooBoardVO", cooBoardVO); // 일반 디테일
		
		
		return "board/cooBoard/read";
	}
	//협업 게시글 수정 글 불러오기
	@GetMapping("/update")
	public String coBoUpdateView(Model model, String cooNm,HttpServletRequest req, RedirectAttributes ra) {
		CooBoardVO cooBoardVO=service.retrievePost(cooNm);
		
		int memberCnt = service.memberCount(cooBoardVO.getPjId());
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("SessionInfo"); // 글쓰는사람의 아이디
		
		
		if (memberVO == null) {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			return "redirect:/coco/login";
		}
		
		String memId = memberVO.getMemId();
		List<ProjectVO> projectList = service.selectProjList(memId);

		MemberVO member = memberService.selectMember(memberVO); // 회원정보 가져오기
		
		model.addAttribute("projectList", projectList);
		model.addAttribute("memberCnt", memberCnt);
		model.addAttribute("memId", memId);
		model.addAttribute("memberVO", member);
		model.addAttribute("cooBoardVO", cooBoardVO); // 일반 디테일
		
		return "board/cooBoard/modify";
	}
	
	@PostMapping("/update")
	public String coBoUpdate(CooBoardVO cooBoardVO,Model model) {
		String gopage="";
		ServiceResult result =service.updateCooBoard(cooBoardVO);
		if(result.equals(ServiceResult.OK)) {
			gopage="redirect:/coco/cooBoard/read?cooNm="+cooBoardVO.getCooNm();
		}else {
			model.addAttribute("message","수정실패");
			gopage="redirect:/coco/cooBoard/read?cooNm="+cooBoardVO.getCooNm();
		}
		return gopage;
	}
	
	
	//협업 신청하기
	@PostMapping("/apply")
	public String cooApplyFormInsert(Model model, CooFormVO cooFormVO,String cooNm) {
		
		model.addAttribute("cooFormVO", cooFormVO);
		log.debug("cooFormVO 잘 들어오나 확인: "+cooFormVO);
		
		service.insertApplyForm(cooFormVO);
		
		return "redirect:/coco/cooBoard/read?cooNm="+cooNm;
	}

	@GetMapping("/form")
	public String cooBoardForm(HttpServletRequest req, @ModelAttribute("CooBoardVO") CooBoardVO cooBoardVO,
			Model model,RedirectAttributes ra) {
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("SessionInfo"); // 글쓰는사람의 아이디

		if (memberVO == null) {
			ra.addFlashAttribute("message", "로그인 후 이용가능합니다!");
			return "redirect:/coco/login";
		}
		
		String memId = memberVO.getMemId();
		List<ProjectVO> projectList = service.selectProjList(memId);

		model.addAttribute("projectList", projectList);
		model.addAttribute("cooBoardVO", cooBoardVO);

		return "board/cooBoard/form";
	}

	@ResponseBody
	@PostMapping(value = "/CooProjectAjax", produces = "application/json;charset=utf-8")
	public ProjectVO CooProjectAjax(@RequestBody Map<String, String> myMap) {

		System.out.println("pjId확인: " + myMap.get("pjId"));
		ProjectVO pjIdList = service.selectPjId(myMap.get("pjId"));

		System.out.println("pjIdList잘나오나요?: " + pjIdList);
		return pjIdList;
	}

	@PostMapping("/insert")
	public String insertProcess(HttpServletRequest req, CooBoardVO cooBoardVO) {
		String goPage = "";
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("SessionInfo");
		ProjectVO projVO = service.selectPjId(cooBoardVO.getPjId());
		System.out.println("프로젝트 상태코드: "+projVO.getPjStatusCode());
		if(projVO.getPjStatusCode().equals("PJST03")) {
			cooBoardVO.setCooDoneYn("Y");
		}else {
			cooBoardVO.setCooDoneYn("N");
		}
		
		if (memberVO != null) {
			cooBoardVO.setWriterId(memberVO.getMemId());
			int rowcnt = service.insertCooBoard(cooBoardVO);
			if (rowcnt > 0) {
				goPage = "redirect:/coco/cooBoard/list";
			} else {
				goPage = "board/cooBoard/form";
			}
		} else {
			goPage = "redirect:/coco/login";
		}
		return goPage;
	}
	
}
