package kr.or.ddit.mapper.board;

import java.util.List;
import java.util.Map;

import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.common.PaginationInfoVO;

public interface BlogBoardMapper {

	public List<MyBlogPostVO> publicBoardList(String postPublicYn, String postDelYn);
	
	//게시글 조회(삭제여부 N, 공개여부Y)
	public MyBlogPostVO selectPublicPost(Map<String, String> map);

	public void incrementHit(String postNum);

	public List<MyBlogPostVO> selectBlBoList(PaginationInfoVO<MyBlogPostVO> pagingVO);

	public int countBlBoList(PaginationInfoVO<MyBlogPostVO> pagingVO);

}
