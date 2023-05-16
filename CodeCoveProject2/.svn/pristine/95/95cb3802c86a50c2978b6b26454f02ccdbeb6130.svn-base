package kr.or.ddit.blog.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.BlogReplyVO;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.common.PaginationInfoVO;

public interface ManageService {
	/**
	 * 카테고리 페이징 처리 및 검색 조회
	 * 
	 * @param catePaingVO
	 * @return
	 */
	public List<BlogCateVO> retrieveJsonCate(PaginationInfoVO<BlogCateVO> catePaingVO);

	/**
	 * 카테고리 이름 수정
	 * 
	 * @param upName
	 * @param cateNum
	 * @return
	 */
	public int modifyCateNm(Map<String, String> updateMap);

	/**
	 * 카테고리 삭제
	 * 
	 * @param delNum
	 * @return
	 */
	public int removeCateNm(String delNum);

	/**
	 * 카테고리 추가
	 * 
	 * @param aa
	 * @return
	 */
	public int createCateNm(String inputData, String memId);

	/**
	 * 게시글 관리, 게시글 조회 및 페이징 ,검색
	 * 
	 * @param postPaginationInfoVO
	 */
	public void retrievePostList(PaginationInfoVO<MyBlogPostVO> postPaginationInfoVO);

	/**
	 * 게시글 삭제처리
	 * 
	 * @param myBlogPostVO
	 * @return
	 */
	public String removePost(MyBlogPostVO myBlogPostVO);

	/**
	 * 댓글관리, 뎃글조회 및 페이징, 검색
	 * 
	 * @param replyPaginationInfoVO
	 */
	public void retrieveReplyList(PaginationInfoVO<BlogReplyVO> replyPaginationInfoVO);

	/**
	 * 댓글삭제
	 * 
	 * @param blogReplyVO
	 * @return
	 */
	public String removeReply(BlogReplyVO blogReplyVO);
}
