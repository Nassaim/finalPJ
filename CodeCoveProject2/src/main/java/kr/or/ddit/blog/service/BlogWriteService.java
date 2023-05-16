package kr.or.ddit.blog.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.blog.vo.BlogHeartVO;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.blog.vo.PostMarkVO;
import kr.or.ddit.common.PaginationInfoVO;

public interface BlogWriteService {

	/**
	 * 블로그 글 작성
	 * 
	 * @param mypost
	 * @return
	 */
	public int createMypost(MyBlogPostVO mypost);

	/**
	 * 블로그수정
	 * 
	 * @param postmark
	 */
	public int modifyPost(Map<String, Object> map);

	public boolean heartYn(BlogHeartVO heart);

	public int createHeart(BlogHeartVO heart);

	public int deleteHeart(BlogHeartVO heart);

	public int countHeart(String postNum);

	public int modifyHeartNo(String postNum);
	
	/**
	 * 북마크리스트 
	 * @param pagingVO
	 * @return
	 */
	public List<PostMarkVO> retrieveMyMarkList(PaginationInfoVO<PostMarkVO> pagingVO);
}
