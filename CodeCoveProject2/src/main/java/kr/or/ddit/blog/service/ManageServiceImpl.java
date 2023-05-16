package kr.or.ddit.blog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.BlogReplyVO;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mapper.blog.ManageMapper;

@Service
public class ManageServiceImpl implements ManageService {
	@Inject
	ManageMapper manageMapper;

	/**
	 * 카테고리 검색 및 페이징 적용
	 */
	@Override
	public List<BlogCateVO> retrieveJsonCate(PaginationInfoVO<BlogCateVO> catePaginationInfoVO) {
		catePaginationInfoVO.setTotalRecord(manageMapper.cateTotalRecord((catePaginationInfoVO)));
		List<BlogCateVO> cateJsonList = manageMapper.selectJsonCate(catePaginationInfoVO);
		catePaginationInfoVO.setDataList(cateJsonList);
		return cateJsonList;
	}

	/**
	 * 카테고리 이름 수정
	 */
	@Override
	public int modifyCateNm(Map<String, String> updateMap) {
		String memId = updateMap.get("memId");
		String blogId = manageMapper.selectBlogId(memId);
		updateMap.put("blogId", blogId);
		int checkCnt = manageMapper.checkNm(updateMap);
		int cnt = 0;
		if (checkCnt > 0) {
			return cnt;
		} else {
			cnt = manageMapper.updateCateNm(updateMap);
			return cnt;
		}
	}

	/**
	 * 카레고리 삭제
	 */
	@Override
	public int removeCateNm(String delNum) {
		// 카테고리 삭제시 해당 게시글도 삭제
		int cnt = manageMapper.deleteCateNm(delNum);
		if (cnt > 0) {
			manageMapper.deletePost(delNum);
			return cnt;
		} else {
			return cnt;
		}
	}

	/**
	 * 카테고리 추가
	 */
	@Override
	public int createCateNm(String inputData, String memId) {
		String blogId = manageMapper.selectBlogId(memId);
		Map<String, String> createMap = new HashMap<>();
		createMap.put("blogId", blogId);
		createMap.put("upName", inputData);

		int checkCnt = manageMapper.checkNm(createMap);
		int cnt = 0;
		if (checkCnt > 0) {
			return cnt;
		} else {
			cnt = manageMapper.insertCate(createMap);
			return cnt;
		}
	}

	/**
	 * 게시글 관리, 게시글 조회 및 페이징 ,검색
	 */
	@Override
	public void retrievePostList(PaginationInfoVO<MyBlogPostVO> postPaginationInfoVO) {
		postPaginationInfoVO.setTotalRecord(manageMapper.postTotalRecord(postPaginationInfoVO));
		List<MyBlogPostVO> postList = manageMapper.selectPostList(postPaginationInfoVO);
		postPaginationInfoVO.setDataList(postList);
	}

	/**
	 * 게시글 삭제처리
	 */
	@Override
	public String removePost(MyBlogPostVO myBlogPostVO) {
		int cnt = manageMapper.deletePostList(myBlogPostVO);
		String msg = null;
		if (cnt > 0) {
			msg = "삭제처리완료";
		} else {
			msg = "삭제처리실패";
		}
		return msg;
	}

	/**
	 * 댓글관리, 뎃글조회 및 페이징, 검색
	 */
	@Override
	public void retrieveReplyList(PaginationInfoVO<BlogReplyVO> replyPaginationInfoVO) {
		replyPaginationInfoVO.setTotalRecord(manageMapper.replyTotalRecord(replyPaginationInfoVO));
		List<BlogReplyVO> postList = manageMapper.selectReplyList(replyPaginationInfoVO);
		replyPaginationInfoVO.setDataList(postList);
	}

	@Override
	public String removeReply(BlogReplyVO blogReplyVO) {
		int cnt = manageMapper.deleteReplyList(blogReplyVO);
		String msg = null;
		if (cnt > 0) {
			msg = "삭제처리완료";
		} else {
			msg = "삭제처리실패";
		}
		return msg;
	}

}
