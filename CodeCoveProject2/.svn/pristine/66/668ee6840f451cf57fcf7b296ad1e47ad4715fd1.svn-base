package kr.or.ddit.mapper.blog;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.blog.vo.BlogReplyVO;

@Mapper
public interface BlogReplyMapper {
	/**
	 * 해당 게시글 댓글조회
	 * @return
	 */
	public List<BlogReplyVO> selectReplyList(String postNum);
	/**
	 * 댓글 추가
	 * @param blogReplyVO
	 * @return
	 */
	public int insertReply(BlogReplyVO blogReplyVO);
	/**
	 * 대댓글 추가
	 * @param blogReplyVO
	 * @return
	 */
	public int insertReReply(BlogReplyVO blogReplyVO);
	/**
	 * 댓글 수정
	 * @param blogReplyVO
	 * @return
	 */
	public int updateReply(BlogReplyVO blogReplyVO);
	/**
	 * 댓글 삭제
	 * @param delNum
	 * @return
	 */
	public int deleteReply(String delNum);
}
