package kr.or.ddit.blog.service;

import java.util.List;

import kr.or.ddit.blog.vo.MyCalendarVO;

public interface MyCalendarService {
	/**
	 * 회원의 일정 리스트 조회
	 * 
	 * @param sessionId
	 * @return
	 */
	public List<MyCalendarVO> retriveMycalList(String sessionId);

	/**
	 * 일정 삽입
	 * 
	 * @param myCalendarVO
	 */
	public int createMyCal(MyCalendarVO myCalendarVO);

	/**
	 * 일정 수정
	 * 
	 * @param myCalendarVO
	 * @return
	 */
	public int modifyCalendar(MyCalendarVO myCalendarVO);

	/**
	 * 일정 삭제
	 * 
	 * @param calNum
	 * @return
	 */
	public int removeCalendar(String calNum);
}
