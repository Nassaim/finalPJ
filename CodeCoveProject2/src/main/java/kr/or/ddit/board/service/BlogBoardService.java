package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.common.PaginationInfoVO;

public interface BlogBoardService {

	public List<MyBlogPostVO> publicBoardList(String postPublicYn, String postDelYn);
	
	
	 // 블로그 게시글 조회
	public MyBlogPostVO retrievePublicPost(String memId, String postNum);

	//블로그 공개 게시글 조회
	public List<MyBlogPostVO> selectBlBoList(PaginationInfoVO<MyBlogPostVO> pagingVO);

	//블로그 게시글 수 조회
	public int countBlBoList(PaginationInfoVO<MyBlogPostVO> pagingVO);

}
