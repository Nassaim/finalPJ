package kr.or.ddit.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.admin.service.ComcodeService;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.PaginationInfoVO;

@Controller
@RequestMapping("/coco/admin")
public class ComCodeController {

	@Inject
	private ComcodeService codeService;

// 공통코드그룹
	// 공통코드그룹 리스트
	@RequestMapping("/codeGroupList")
	public String codeGroupForm2(
					@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
					@RequestParam(value = "searchWord", required = false) String searchWord, Model model) {
		PaginationInfoVO<ComCodeVO> pagingVO = new PaginationInfoVO<ComCodeVO>(8, 3);

		if(StringUtils.isNoneBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = codeService.selectCodeGroupCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<ComCodeVO> dataList = codeService.selectComCodeGroupList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		return "admins/comcode/listCodeGroup";
	}

	// 공통코드그룹 등록 메소드
	@PostMapping("/registerGroup")
	public String registerCode(HttpServletRequest req, ComCodeVO comCodeVO, Model model) {
		String goPage = "";
		Map<String, String> errors = new HashMap<String, String>();

		if (StringUtils.isBlank(comCodeVO.getComCodeGrp())) {
			errors.put("comCode", "관리코드그룹을 입력해주세요.");
		}
		if (StringUtils.isBlank(comCodeVO.getComCodeGrpNm())) {
			errors.put("comCode", "관리코드그룹이름을 입력해주세요.");
		}

		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("codeCodeVO", comCodeVO);
			goPage = "coco/admin/form";
		} else {
			HttpSession session = req.getSession();

			ServiceResult result = codeService.insertComCodeGroup(req, comCodeVO);
			if (result.equals(ServiceResult.OK)) {
				goPage = "redirect:/coco/admin/codeGroupList";
			} else {
				errors.put("message", "서버 에러, 다시 시도해주세요!");
				model.addAttribute("errors", errors);
				goPage = "coco/admin/codeGroupList";
			}
		}
		return goPage;
	}
	
	// 공통코드그룹 수정
	@PostMapping("/modifyGroup")
	public String modifyGroup(HttpServletRequest req, ComCodeVO comCodeVO, Model model) {
		
		String goPage = "";
		
		ServiceResult result = codeService.modifyComCodeGroup(req, comCodeVO);
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/coco/admin/codeGroupList";
		} else {
			model.addAttribute("message", "수정에 실패하였습니다.");
			model.addAttribute("comCodeVO", comCodeVO);
			goPage = "redirect:/coco/admin/codeGroupList";
		}
		return goPage;
	}
	
	// 공통코드그룹 삭제
	@PostMapping("/removeGroup")
	public String removeComCodeGroup(HttpServletRequest req, ComCodeVO comCodeVO, Model model) {
		String goPage = "";
		ServiceResult result = codeService.removeComCodeGroup(comCodeVO);
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/coco/admin/codeGroupList";
		} else {
			goPage = "redirect:/coco/admin/codeGroupList";
		}
		return goPage;
	}


// 공통코드
	// 공통코드 리스트
	@RequestMapping(value = "/codelist")
	public String codeRetrieveList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchWord", required = false) String searchWord, Model model) {
		
		PaginationInfoVO<ComCodeVO> pagingVO = new PaginationInfoVO<ComCodeVO>(6, 5);
		
		if(StringUtils.isNoneBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = codeService.selectCodeCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<ComCodeVO> dataList = codeService.selectComCodeList(pagingVO);
		pagingVO.setDataList(dataList);
		
		List<ComCodeVO> grpList = codeService.selectCodeGroupList();
		
		model.addAttribute("grpList", grpList);
		model.addAttribute("pagingVO", pagingVO);
		return "admins/comcode/listCode";
	}

	// 공통코드 디테일
	@GetMapping("/codeDetail")
	public String codeDetail(String comCode, Model model) {
		ComCodeVO ComCodeVO = codeService.selectCode(comCode);
		model.addAttribute("ComCodeVO", ComCodeVO);

		return "admins/comcode/detailCode";
	}

	// 공통코드 등록폼
	@GetMapping("/codeForm")
	public String insertCodeForm(Model model) {

		List<ComCodeVO> grpList = codeService.selectGrpList();

		model.addAttribute("grpList", grpList);
		return "admins/comcode/formCode";
	}

	// 공통코드 등록
	@PostMapping("/registerComCode")
	public String registerComCode(HttpServletRequest req, ComCodeVO comCodeVO, Model model) {
		String goPage = "";
		HttpSession session = req.getSession();

		ServiceResult result = codeService.registerComCode(req, comCodeVO);
		if (result.equals(ServiceResult.OK)) {
			goPage = "redirect:/coco/admin/codelist";
		} else {

		}
		return goPage;
	}
	
	// 공통코드 수정 폼
	@GetMapping("/codeModifyForm")
	public String codeModifyForm(String comCode, Model model) {
		ComCodeVO comCodeVO = codeService.selectCode(comCode);
		
		List<ComCodeVO> grpList = codeService.selectGrpList();
		
		model.addAttribute("grpList", grpList);
		model.addAttribute("comCodeVO", comCodeVO);
		model.addAttribute("status", "u");
		return "admins/comcode/formCode";
	}
	
	// 공통코드 수정 메소드
	@PostMapping("/modifyCode")
	public String modifyCode(HttpServletRequest req, ComCodeVO comCodeVO, Model model) {
		String goPage = "";
		ServiceResult result = codeService.modifyComCode(req, comCodeVO);
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/coco/admin/codelist";
		} else {
			model.addAttribute("message", "수정에 실패하였습니다.");
			model.addAttribute("comCodeVO", comCodeVO);
			goPage = "redirect:/coco/admin/codeModifyForm";
		}
		
		return goPage;
	}
	
	// 공통코드 삭제 메소드
	@PostMapping("/removeComCode")
	public String removeComCode(HttpServletRequest req, String comCode, Model model) {
		String goPage = "";
		ServiceResult result = codeService.removeComCode(comCode);
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/coco/admin/codelist";
		} else {
			goPage = "redirect:/coco/admin/codeDetail?comCode=" + comCode;
		}
		
		return goPage;
	}


}
