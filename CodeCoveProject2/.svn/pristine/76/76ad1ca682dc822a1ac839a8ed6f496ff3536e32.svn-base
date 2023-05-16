package kr.or.ddit.common.chat.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.common.chat.service.IChatService;
import kr.or.ddit.common.chat.vo.ChatFile;
import kr.or.ddit.common.chat.vo.ChatVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/coco/chatting")
@Controller
public class ChatController {

	@Inject
	private IChatService chatService;

	@Inject
	private IMemberService memberService;

    @Resource(name = "uploadPath")
    private String uploadPath;
    
    // 구매채팅
	@RequestMapping(value="/chatHome/{crNum}", method = RequestMethod.GET) 
	public String chatHome(@PathVariable String crNum, Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		MemberVO member = memberService.selectMember(sessionMember);
		
		String sellerNick = chatService.selectNickName(crNum); // 판매자 닉네임
		List<ChatVO> chatVOList = chatService.selectChatlog(crNum); // 채팅로그 가져오기
		
		model.addAttribute("crNum", crNum);
		model.addAttribute("member", member);
		model.addAttribute("chatList", chatVOList);
		model.addAttribute("sellerNick", sellerNick); // 판매자 닉네임
		
		
		return "chat/chatHome";
	}
	

	
    // 프로젝트 채팅
	@RequestMapping(value="/chatProject", method = RequestMethod.GET) 
	public String chatProject(Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		MemberVO sessionMember = (MemberVO) session.getAttribute("SessionInfo");
		
		MemberVO member = memberService.selectMember(sessionMember);
		
		// 가입한 프로젝트 다 들고오기
		List<ChatVO> chatRoomList = chatService.selectChatRoomList(sessionMember.getMemId());
		
		// crNum을 가지고와야함
//		List<ChatVO> chatVOList = chatService.selectChatlog(crNum);
//		
//		model.addAttribute("crNum", crNum);
		model.addAttribute("member", member);
//		model.addAttribute("chatList", chatVOList);
//		model.addAttribute("sellerNick", sellerNick); // 판매자 닉네임
		model.addAttribute("chatRoomList", chatRoomList); // 가입한 프로젝트 다 들고오기
		
		return "chat/alarm/chatProject";
	}
	
	
	@ResponseBody
	@PostMapping(value = "/selectChatLogsPj", produces = "application/json;charset=utf-8")
	public List<ChatVO> selectChatLogsProject(@RequestParam String crNum) throws Exception {
		
		log.debug("crNum 확인용 " + crNum);
		
		List<ChatVO> chatVOList = chatService.selectChatlog(crNum);
		
		// 이거 만들어놓은거 전송되는지 확인 insert한 후에 하기
		return chatVOList;
	}
	
	
	
	// uploadAjax 메소드는 브라우저에서 넘겨받은 파일을 업로드하고 s_가 붙은 파일의 썸네일 파일을 생성하는 기능을 담당합니다.
	@ResponseBody // <-응답데이터 보내는 용 
	@RequestMapping(value="/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
//	public ResponseEntity<String> uploadAjax(ChatVO chatVO) throws Exception {
		
		// 파일 처리
		String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		
		return new ResponseEntity<String>(savedName, HttpStatus.CREATED);
	}
	
	
	// 채팅방 중복체크
	@ResponseBody
	@PostMapping(value = "/roomCheck", produces = "application/json;charset=utf-8")
	public Map<String, String> roomCheck(@RequestParam String epayNum, Model model) throws Exception {
		
		log.debug("epayNum 확인용 " + epayNum);
		
		Map<String, String> roomMap = chatService.roomCheck(epayNum);
		
		log.debug("룸체크 결과 확인 맵 >> " + roomMap);
		
		return roomMap;
	}
	
	
	// 채팅방 중복체크
	@ResponseBody
	@RequestMapping(value="/roomCreate", method = RequestMethod.POST) 
	public Map<String, String> roomCreate(@RequestParam String epayNum, Model model) throws Exception { 
		
		Map<String, String> resultMap = chatService.roomCreate(epayNum);
		// ok - fail
		
		log.debug("chatroom 생성 인서트 결과 확인 : " + resultMap);
		
		return resultMap;
	}
	
	
	// 일반 메세지 인서트
	// 채팅방 중복체크
	@ResponseBody
	@PostMapping(value = "/chatMsgInsert", produces = "application/json;charset=utf-8")
	public ServiceResult chatMsgInsert(@RequestBody ChatVO chatVO, Model model) throws Exception {
		
		log.debug("채팅인서트 컨트롤러에 도달햇습니다 확인 {} : " , chatVO);
		// 채팅 일반 메세지 insert
		ServiceResult result = chatService.chatMsgInsert(chatVO);
//		Map<String, String> roomMap = chatService.roomCheck(epayNum);
		
		return result;
	}
	
	
	// 일반 메세지 인서트
	// 채팅방 중복체크
	@ResponseBody
	@PostMapping(value = "/chatFileInsert", produces = "application/json;charset=utf-8")
	public ServiceResult chatFileInsert(@RequestBody ChatVO chatVO, Model model) throws Exception {
	
		log.debug("파일 insert chatVO 확인 : {} ", chatVO);
		
		// 파일 insert
		log.debug("채팅인서트 컨트롤러에 도달햇습니다 확인 {} : " , chatVO);
		// 채팅 일반 메세지 insert
		ServiceResult result = chatService.fileInsert(chatVO);
		
		return result;
	}
	
	
	
	
	
	
	@RequestMapping(value="/displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		log.info("fileName : " + fileName);
	
		try {
		
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); // 확장자 추출
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""
						+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		
		} finally {
			in.close();
		}
			return entity;
			
	}// display
	
	
}
