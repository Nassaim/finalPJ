package kr.or.ddit.common.chat.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.common.chat.vo.AlarmVO;
import kr.or.ddit.common.chat.vo.ChatFile;
import kr.or.ddit.common.chat.vo.ChatVO;

public interface IChatService {

//	public void register(ChatFile chatFile) throws Exception;

	public Map<String, String> roomCheck(String epayNum);

	// 구매내역 채팅방 생성
	public Map<String, String> roomCreate(String epayNum);

	// 채팅 일반 메세지 insert
	public ServiceResult chatMsgInsert(ChatVO chatVO);

	// 파일 insert
	public ServiceResult fileInsert(ChatVO chatVO);

	public List<ChatVO> selectChatlog(String crNum);

	//닉네임뽑기
	public String selectNickName(String crNum);

	// 프로젝트 채팅방 생성
	public void roomCreatePj(String pjId);

	public List<ChatVO> selectChatRoomList(String memId);

	public ServiceResult alarmMsgInsert(AlarmVO alarmVO);

	// 알림 select 
	public List<AlarmVO> selectAlarmLogs(String receiverId);

	// 알림 확인용(N->Y)
	public ServiceResult alarmChkModify(String newsNum);

	
}
