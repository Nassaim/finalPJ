package kr.or.ddit.common.chat.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.common.chat.service.IChatService;
import kr.or.ddit.common.chat.vo.AlarmVO;
import kr.or.ddit.common.chat.vo.ChatVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/coco/project")
@Controller
public class AlarmController {

	@Inject
	private IChatService chatService;

	@Inject
	private IMemberService memberService;


    @Resource(name = "uploadPath")
    private String uploadPath;
    
    
//    @ResponseBody
//    @PostMapping(value = "/selectSessionId", produces = "application/json;charset=utf-8")
//    public String selectSessionId(HttpServletRequest req) throws Exception {
//    	
//		HttpSession session = req.getSession();
//		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
//
//		log.debug("세션확인>"+ sessionMember);
//		
//		String loginIdH = sessionMember.getMemId();
//    	
//    	return loginIdH;
//    }
    
    @ResponseBody
    @PostMapping(value = "/selectSessionId", produces = "application/json;charset=utf-8")
    public MemberVO selectSessionId(HttpServletRequest req) throws Exception {
    	
    	HttpSession session = req.getSession();
    	MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
    	
    	log.debug("세션확인>"+ sessionMember);
    	
    	String loginIdH = sessionMember.getMemId();
    	
    	return sessionMember;
    }

    @ResponseBody
	@PostMapping(value = "/alarmInsert", produces = "application/json;charset=utf-8")
	public ServiceResult alarmMsgInsert(@RequestBody AlarmVO alarmVO, Model model) throws Exception {
		
		log.debug("알람 컨트롤러에 도달햇습니다 확인 {} : " , alarmVO);
		// 채팅 일반 메세지 insert
		ServiceResult result = chatService.alarmMsgInsert(alarmVO);
//		Map<String, String> roomMap = chatService.roomCheck(epayNum);
		
		return result;
	}
	
    
	@ResponseBody
	@PostMapping(value = "/selectAlarmLogs", produces = "application/json;charset=utf-8")
	public List<AlarmVO> selectAlarmLogs(@RequestParam String receiverId) throws Exception {
		
		log.debug("receiverId 확인용 " + receiverId);
		
		List<AlarmVO> alarmVOList = chatService.selectAlarmLogs(receiverId);
		
		// 이거 만들어놓은거 전송되는지 확인 insert한 후에 하기
		return alarmVOList;
	}

	
	@ResponseBody
	@PostMapping(value = "/alarmChkModify", produces = "application/json;charset=utf-8")
	public ServiceResult alarmChkModify(@RequestParam String newsNum) throws Exception {
		
		log.debug("newsNum 확인용 " + newsNum);
		
		ServiceResult result = chatService.alarmChkModify(newsNum);
		
		return result;
	}
	
    
	
	
}
