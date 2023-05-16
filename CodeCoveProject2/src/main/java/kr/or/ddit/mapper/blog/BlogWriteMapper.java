package kr.or.ddit.mapper.blog;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.blog.vo.BlogHeartVO;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.blog.vo.PostMarkVO;
import kr.or.ddit.common.PaginationInfoVO;

@Mapper
public interface BlogWriteMapper {
	/**
	 * 블로그 글 작성
	 * 
	 * @return
	 */
	public int insertMyPost(MyBlogPostVO mypost);

	/**
	 * 블로그게시글 수정
	 * 
	 * @param mypost
	 * @return
	 */
	public int updatePost(MyBlogPostVO mypost);

	/**
	 * 하트수
	 * 
	 * @param postNum
	 * @return
	 */

	public BlogHeartVO selectHeartYn(BlogHeartVO heart);

	public int selectTotalHeart(String postNum);

	public int insertHeart(BlogHeartVO heart);

	public int deleteHeart(BlogHeartVO heart);

	public int updateHeartNo(String postNum);
	
	/**
	 * 북마크 토탈 수 
	 * @param memId
	 * @return
	 */
	public int selectmyMarkTotal(PaginationInfoVO<PostMarkVO> pagingVO);
	/**
	 * 북마크리스트 
	 * @param pagingVO
	 * @return
	 */
	public List<PostMarkVO> selectmyMarkList(PaginationInfoVO<PostMarkVO> pagingVO);
}
