package kr.or.ddit.mainpage.contorller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mainpage.service.QnAService;
import kr.or.ddit.mainpage.vo.QnAVO;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco")
public class CSController {
	
	@Inject
	private QnAService qnaService;
	
	@RequestMapping("/QnABoard")
	public String QnABoardList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage, 
			@RequestParam(value = "searchWord", required = false) String searchWord, Model model) {
		
		PaginationInfoVO<QnAVO> pagingVO = new PaginationInfoVO<QnAVO>(10, 5);
		
		if(StringUtils.isNoneBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = qnaService.countQnAList(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		
		List<QnAVO> dataList = qnaService.selectQnABoardList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		if(currentPage == 1){
			model.addAttribute("start", totalRecord);
		}else {
			model.addAttribute("start", totalRecord - pagingVO.getScreenSize() * (currentPage-1));
		}
		return "mainpages/QnA/ListQnABoard";
	}
	
	@GetMapping("/QnARegisterForm")
	public String QnABoardRegisterForm() {
		return "mainpages/QnA/RregisterQnAForm";
	}
	
	@PostMapping("/QnARegister")
	public String QnABoardRegister(HttpServletRequest req, @ModelAttribute("qnaVO") QnAVO qnaVO, Model model) {
		String goPage = "";
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO)session.getAttribute("SessionInfo");
		
		if(sessionMember == null) {
			goPage = "redirect:/coco/login";
		} else {
			qnaVO.setWriterId(sessionMember.getMemId());
			int cnt = qnaService.registerQnABoard(qnaVO);
			if(cnt > 0) {
				goPage = "redirect:/coco/QnABoard";
			} else {
				goPage = "/coco/QnARegisterForm";
			}
		}
		return goPage;
	}
	
	@GetMapping("/QnABoardRead")
	public String QnABoardRead(HttpServletRequest req, String qnaNum, Model model) {
		QnAVO qnaVO = qnaService.readQnA(qnaNum);
		
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("SessionInfo");
		
		model.addAttribute("qnaVO", qnaVO);
		return "mainpages/QnA/ReadQnABoard";
	}
	
	@RequestMapping("/AnswerRegister")
	public String registerAnswer(HttpServletRequest req, String answerContent , String qnaNum , Model model) {
		String goPage = "";
		HttpSession session = req.getSession();
		MemberVO sessionMember = (MemberVO)session.getAttribute("SessionInfo");
		String answerId = sessionMember.getMemId();
		
		int cnt = qnaService.registerAnswer(answerId, answerContent, qnaNum);
		
		if(cnt > 0) {
			goPage = "redirect:/coco/QnABoardRead?qnaNum="+qnaNum; 
		} else {
			goPage = "redirect:/coco/QnABoardRead?qnaNum="+qnaNum;
		}
		
		return goPage;		
	}
	
}
