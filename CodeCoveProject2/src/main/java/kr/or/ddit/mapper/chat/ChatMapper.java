package kr.or.ddit.mapper.chat;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.common.chat.vo.AlarmVO;
import kr.or.ddit.common.chat.vo.ChatVO;

public interface ChatMapper {

//	public void register(@Param("fullName")String fileName) throws Exception;

	public ChatVO roomCheck(String epayNum);

	// 구매내역 채팅방 생성
	public int roomCreate(String epayNum);

	// 채팅 일반 메세지 insert
	public int chatMsgInsert(ChatVO chatVO);

	// 채팅 파일 insert
	public int fileInsert(ChatVO chatVO);

	// 채팅 로그 select
	public List<ChatVO> selectChatlog(String crNum);

	public String selectNickName(String crNum);

	// 프로젝트 채팅방 생성
	public void roomCreatePj(String pjId);

	// 프로젝트 채팅방 리스트 모음
	public List<ChatVO> selectChatRoomList(String memId);

	// 알람 메세지 insert
	public int alarmMsgInsert(AlarmVO alarmVO);

	// 알림 메세지 select 
	public List<AlarmVO> selectAlarmLogs(String receiverId);

	// 알림 확인용(N->Y)
	public int alarmChkModify(String newsNum);

}
