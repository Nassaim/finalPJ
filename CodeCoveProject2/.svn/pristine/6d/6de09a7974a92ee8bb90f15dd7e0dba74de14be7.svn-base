package kr.or.ddit.mapper.blog;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.BlogReplyVO;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.common.PaginationInfoVO;

@Mapper
public interface ManageMapper {
	/**
	 * 카테고리 페이징처리를 위한 레코드 수 조회
	 * @param catePaginationInfoVO
	 * @return
	 */
	public int cateTotalRecord(PaginationInfoVO<BlogCateVO> catePaginationInfoVO);
	
	/**
	 * 카테고리 페이징 검색 조회
	 * @param catePaginationInfoVO
	 * @return
	 */
	public List<BlogCateVO> selectJsonCate(PaginationInfoVO<BlogCateVO> catePaginationInfoVO);
	/**
	 * 카테고리 이름 중복 확인
	 * @param updateMap
	 * @return
	 */
	public int checkNm(Map<String, String> updateMap);
	/**
	 * 카테고리 이름 수정
	 * @param upName
	 * @param cateNum
	 * @return
	 */
	public int updateCateNm(Map<String, String> updateMap);
	/**
	 * 카테고리 삭제
	 * @param delNum
	 * @return
	 */
	public int deleteCateNm(String delNum);
	/**
	 * 카테고리 관련 게시글 삭제
	 * @param delNum
	 */
	public void deletePost(String delNum);
	/**
	 * 블로그 Id가져오기
	 * @param memId
	 * @return
	 */
	public String selectBlogId(String memId);
	/**
	 * 블로그 카테고리 추가
	 * @param createMap
	 * @return
	 */
	public int insertCate(Map<String, String> createMap);
	
	/**
	 * 블로그 게시글 페이징처리를 위한 레코드 수 조회 
	 * @param postPaginationInfoVO
	 * @return
	 */
	public int postTotalRecord(PaginationInfoVO<MyBlogPostVO> postPaginationInfoVO);
	/**
	 * 블로그 게시글 페이징 처리 및 검색
	 * @param postPaginationInfoVO
	 * @return
	 */
	public List<MyBlogPostVO> selectPostList(PaginationInfoVO<MyBlogPostVO> postPaginationInfoVO);
	/**
	 * 블로그 게시글 삭제처리
	 * @param myBlogPostVO
	 * @return
	 */
	public int deletePostList(MyBlogPostVO myBlogPostVO);
	/**
	 * 댓글관리 페이징처리를 위한 레코드 수 조회
	 * @param replyPaginationInfoVO
	 * @return
	 */
	public int replyTotalRecord(PaginationInfoVO<BlogReplyVO> replyPaginationInfoVO);
	/**
	 * 댓글관리 페이징 처리 및 검색
	 * @param replyPaginationInfoVO
	 * @return
	 */
	public List<BlogReplyVO> selectReplyList(PaginationInfoVO<BlogReplyVO> replyPaginationInfoVO);
	/**
	 * 블로그 댓글 삭제처리
	 * @param blogReply
	 * @return
	 */
	public int deleteReplyList(BlogReplyVO blogReplyVO);
}
