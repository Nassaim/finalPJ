package kr.or.ddit.blog.service;

import java.util.List;
import java.util.Map;

import org.json.simple.parser.ParseException;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.blog.vo.TodoVO;
import kr.or.ddit.common.PaginationInfoVO;

public interface MyBlogService {
	/**
	 * 블로그 카테고리 조회
	 * 
	 * @return
	 */
	public List<BlogCateVO> retrieveCate(String memId);

	/**
	 * 블로그 아이디 존재여부 확인
	 */
	public int checkMemId(String memId);

	/**
	 * 블로그 게시글 최신순 조회
	 * 
	 * @param map      카테고리, 회원 아이디
	 * @param pagingVO
	 */
	public void retrievePostList(Map<String, Object> map, PaginationInfoVO<MyBlogPostVO> pagingVO) throws ParseException;

	/**
	 * 블로그 게시글 조회
	 * 
	 * @param postNum 조회할 게시글 번호
	 */
	public MyBlogPostVO retrievePost(String memId, String postNum);

	/**
	 * 게시글 비공개 처리
	 * 
	 * @param memId
	 * @param postNum
	 * @return
	 */
	public ServiceResult postPrivate(Map<String, String> map);

	/**
	 * 게시글 삭제
	 * 
	 * @param memId
	 * @param postNum
	 * @return
	 */
	public ServiceResult delPost(String memId, String postNum);

	/**
	 * 투두리스트 목록
	 * 
	 * @param map
	 * @return
	 */
	public List<TodoVO> retrieveTodo(Map<String, String> map);

	/**
	 * 투두리스트 추가
	 * 
	 * @param todo
	 * @return
	 */
	public ServiceResult addTodo(TodoVO todo);

	/**
	 * 투두리스트 내용 수정
	 * 
	 * @param todo
	 * @return
	 */
	public ServiceResult upTodo(TodoVO todo);

	/**
	 * 투두리스트 체크여부 확인
	 * 
	 * @param todo
	 * @return
	 */
	public ServiceResult ynTodo(TodoVO todo);

	/**
	 * 투두리스트 삭제
	 * 
	 * @param checkNum
	 * @return
	 */
	public ServiceResult delTodo(String checkNum);

}
