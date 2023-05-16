package kr.or.ddit.mapper.blog;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.blog.vo.MyCalendarVO;

@Mapper
public interface MyCalendarMapper {
	/**
	 * 회원의 일정 리스트 조회
	 * @param sessionId
	 * @return
	 */
	public List<MyCalendarVO> selectMyCalList(String sessionId);
	/**
	 * 블로그 아이디 받아오기
	 * @param memId
	 * @return
	 */
	public String selectBlogId(String memId);
	/**
	 * 일정 삽입
	 * @param myCalendarVO
	 */
	public int insertMyCal(MyCalendarVO myCalendarVO);
	/**
	 * 일정 수정
	 * @param myCalendarVO
	 * @return
	 */
	public int updateCalendar(MyCalendarVO myCalendarVO);
	/**
	 * 일정 삭제
	 * @param myCalendarVO
	 * @return
	 */
	public int deleteCalendar(String calNum);
}
