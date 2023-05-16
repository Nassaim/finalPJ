package kr.or.ddit.common.chat.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.common.chat.service.IChatService;
import kr.or.ddit.common.chat.vo.AlarmVO;
import kr.or.ddit.common.chat.vo.ChatFile;
import kr.or.ddit.common.chat.vo.ChatVO;
import kr.or.ddit.mapper.chat.ChatMapper;
import kr.or.ddit.member.vo.MemberRole;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatServiceImpl implements IChatService {
	
	@Inject
	private ChatMapper chatMapper;
	
	
//	@Override
//	public void register(ChatFile chatFile) throws Exception {
//		
//		String[] files = chatFile.getFiles();
//		
//		if(files == null) {
//			return;
//		}
//		
//		for (String fileName : files) {
//			
//			chatMapper.register(fileName);
//		}
//		
//	}


	
	@Override
	public Map<String, String> roomCheck(String epayNum) {
		String result = null;
		
		ChatVO chatVO = chatMapper.roomCheck(epayNum);
		Map<String, String> resultMap = new HashMap<String, String>();
		
		log.debug("방있는지 확인여부 >> "+ chatVO);
		
		if (chatVO != null) {
			result = "EXIST";
			resultMap.put("roomNo", chatVO.getCrNum());
			resultMap.put("result", result);
		} else {
			result = "NOTEXIST";
			resultMap.put("result", result);
		}
		
		log.debug("resultMap 확인 {} : ", resultMap);
		
		return resultMap;
	}


	// 구매내역 채팅방 생성
	@Override
	public Map<String, String> roomCreate(String epayNum) {
		String result = "";

		int status = chatMapper.roomCreate(epayNum);
		
		ChatVO chatVO = chatMapper.roomCheck(epayNum);
		String roomNo = chatVO.getCrNum();
		Map<String, String> resultMap = new HashMap<String, String>();
		
		if (status > 0) {
			result = "OK";
			resultMap.put("roomNo", roomNo);
			resultMap.put("result", result);
		} else {
			result = "FAIL";
			resultMap.put("result", result);
		}
		return resultMap;
	}

	
	// 채팅 일반 메세지 insert
	@Override
	public ServiceResult chatMsgInsert(ChatVO chatVO) {
		ServiceResult result = null;

		int status = chatMapper.chatMsgInsert(chatVO);
		
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}


	@Override
	public ServiceResult fileInsert(ChatVO chatVO) {
		
		ServiceResult result = null;
//		String crFile= chatVO.getCrFile();

		int status = chatMapper.fileInsert(chatVO);
		
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}


	@Override
	public List<ChatVO> selectChatlog(String crNum) {
		return chatMapper.selectChatlog(crNum);
	}


	@Override
	public String selectNickName(String crNum) {
		return chatMapper.selectNickName(crNum);
	}


	@Override
	public void roomCreatePj(String pjId) {
		chatMapper.roomCreatePj(pjId);
	}


	@Override
	public List<ChatVO> selectChatRoomList(String memId) {
		return chatMapper.selectChatRoomList(memId);
	}


	@Override
	public ServiceResult alarmMsgInsert(AlarmVO alarmVO) {
		ServiceResult result = null;

		int status = chatMapper.alarmMsgInsert(alarmVO);
		
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}


	@Override
	public List<AlarmVO> selectAlarmLogs(String receiverId) {
		return chatMapper.selectAlarmLogs(receiverId);
	}


	@Override
	public ServiceResult alarmChkModify(String newsNum) {
		ServiceResult result = null;

		int status = chatMapper.alarmChkModify(newsNum);
		
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

}
