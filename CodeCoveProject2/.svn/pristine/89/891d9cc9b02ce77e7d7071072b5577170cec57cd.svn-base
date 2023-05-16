package kr.or.ddit.mainpage.contorller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.mainpage.service.MainpageService;
import kr.or.ddit.project.project.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco")
public class MainVeiwContorller {
	
	@Inject
	private MainpageService mainService;
	
	
	@GetMapping("/main")
	public String mainpageView(Model model) {
		List<CooBoardVO> coboList= mainService.cobolist();
		ProjectVO pjVO = mainService.getTotalPj();
		
		model.addAttribute("pjVO", pjVO);
		model.addAttribute("coboList", coboList);
		return "mainpages/main/content";
	}
	
	@GetMapping("/premium")
	public String premiumView() {
		return "mainpages/premium/premium";
	}
	
	@GetMapping("/intro")
	public String introView() {
		return "mainpages/intro/intro";
	}
	
}
