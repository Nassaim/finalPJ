package kr.or.ddit.mapper.blog;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.blog.vo.TodoVO;

@Mapper
public interface MyBlogMapper {
	/**
	 * 블로그 카테고리 정보 가져오기
	 * 
	 * @param memId
	 * @return
	 */
	public List<BlogCateVO> selectCate(String memId);

	/**
	 * 블로그 사용자 확인
	 * 
	 * @param memId
	 * @return
	 */
	public int selectMemId(String memId);

	/**
	 * 게시글 목록 조회를 위한 레코드 수 조회
	 * 
	 * @param map
	 * @return
	 */
	public int selectTotalPostRecord(Map<String, Object> map);

	/**
	 * 게시글 목록
	 * 
	 * @param map
	 * @return
	 */
	public List<MyBlogPostVO> selectPostList(Map<String, Object> map);

	/**
	 * 게시글 조회
	 * 
	 * @param postNum 조회할 게시글 번호
	 */
	public MyBlogPostVO selectPost(Map<String, String> map);

	/**
	 * 게시글 비공개 처리
	 * 
	 * @param map 비공개할 게시글 번호와 비공개 여부
	 * @return 성공 1, 실패 0
	 */
	public int privatePost(Map<String, String> map);

	/**
	 * 게시글 삭제 처리
	 * 
	 * @param postNum 삭제 게시글 번호
	 * @return 성공 1, 실패 0
	 */
	public int delPost(String postNum);

	/**
	 * 조회수 +1
	 * 
	 * @param postNum 조회한 게시글 번호
	 * @return 성공 1, 실패 0
	 */
	public int incrementHit(String postNum);

	// 투두리스트
	/**
	 * 블로그 아이디 가져오기
	 * 
	 * @param memId 가져올 블로그 주인 아이디
	 * @return
	 */
	public String selectBlogId(String memId);

	/**
	 * 투두리스트 가져오기
	 * 
	 * @param map 회원 아이디, 체크여부, 날짜
	 * @return
	 */
	public List<TodoVO> selectTodoList(Map<String, String> map);

	/**
	 * 투두리스트 추가
	 * 
	 * @param todo 추가할 투두리스트 정보
	 * @return 성공 1, 실패 0
	 */
	public int insertTodo(TodoVO todo);

	/**
	 * 투두리스트 내용 수정
	 * 
	 * @param todo 수정할 투두리스트 정보
	 * @return 성공 1, 실패 0
	 */
	public int updateTodo(TodoVO todo);

	/**
	 * 투두리스트 체크 여부 변경
	 * 
	 * @param todo 체크 여부 변경할 투두리스트 정보
	 * @return 성공 1, 실패 0
	 */
	public int updateYn(TodoVO todo);

	/**
	 * 투두리스트 정보 삭제
	 * 
	 * @param checkNum 삭체할 투두리스트 번호
	 * @return 성공 1, 실패 0
	 */
	public int delTodo(String checkNum);

	/**
	 * 당일 투두리스트 총 개수
	 * 
	 * @param map 조회할 투두리스트 정보
	 * @return
	 */
	public int dailyCheckAllList(Map<String, String> map);

	/**
	 * 당일 완료한 투두리스트 개수
	 * 
	 * @param map
	 * @return
	 */
	public int dailyCheckYList(Map<String, String> map);

}
