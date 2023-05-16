package kr.or.ddit.blog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.blog.vo.MyCalendarVO;
import kr.or.ddit.mapper.blog.MyCalendarMapper;

@Service
public class MyCalendarServiceImpl implements MyCalendarService {
	@Inject
	MyCalendarMapper myCalMapper;

	/**
	 * 회원의 일정 리스트 조회
	 */
	@Override
	public List<MyCalendarVO> retriveMycalList(String sessionId) {
		return myCalMapper.selectMyCalList(sessionId);
	}

	/**
	 * 일정 삽입
	 */
	@Override
	public int createMyCal(MyCalendarVO myCalendarVO) {

		myCalendarVO.setBlogId(myCalMapper.selectBlogId(myCalendarVO.getBloggerId()));
		myCalendarVO.setCalStartDate(myCalendarVO.getCalStartDate().replace("T", ""));
		myCalendarVO.setCalEndDate(myCalendarVO.getCalEndDate().replace("T", ""));
		int cnt = myCalMapper.insertMyCal(myCalendarVO);
		return cnt;
	}

	/**
	 * 일정 수정
	 */
	@Override
	public int modifyCalendar(MyCalendarVO myCalendarVO) {
		myCalendarVO.setCalStartDate(myCalendarVO.getCalStartDate().replace("T", ""));
		myCalendarVO.setCalEndDate(myCalendarVO.getCalEndDate().replace("T", ""));
		int cnt = myCalMapper.updateCalendar(myCalendarVO);
		return cnt;
	}

	/**
	 * 일정 삭제
	 */
	@Override
	public int removeCalendar(String calNum) {
		int cnt = myCalMapper.deleteCalendar(calNum);
		return cnt;
	}

}
