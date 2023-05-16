package kr.or.ddit.project.project.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco/project")
public class projectTutorialController {
	
	@GetMapping("/tutorial")
	public String projectTutorial() {
//		HttpSession session = req.getSession();
//		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		
		return "projectTutorial/tutorial";
	}

}
