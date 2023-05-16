package kr.or.ddit.board.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.board.service.BlogBoardService;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.common.exception.NotAuthorityException;
import kr.or.ddit.common.exception.NotFoundException;
import kr.or.ddit.mapper.board.BlogBoardMapper;

@Service
public class BlogBoardServiceImpl implements BlogBoardService {
	
	@Inject
	private BlogBoardMapper blBoMapper;
	

	@Override
	public List<MyBlogPostVO> publicBoardList(String postPublicYn,String postDelYn) {
		return blBoMapper.publicBoardList(postPublicYn,postDelYn);
	}


	@Override
	public MyBlogPostVO retrievePublicPost(String memId, String postNum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("postNum", postNum);

		MyBlogPostVO post = blBoMapper.selectPublicPost(map);

		if (post == null) {
			throw new NotFoundException();
		}

		sendError(post);
		if (StringUtils.equals(post.getPostPublicYn(), "N")) {
			throw new NotAuthorityException();
		}

		blBoMapper.incrementHit(postNum);
		return post;
	}
	public void sendError(MyBlogPostVO post) {
		if (StringUtils.equals(post.getPostBlindYn(), "Y")) {
			throw new NotFoundException(String.format("'%s' 게시글은 차단된 게시글입니다.", post.getPostTitle()));
		} else if (StringUtils.equals(post.getPostDelYn(), "Y")) {
			throw new NotFoundException(String.format("'%s' 게시글이 없습니다.", post.getPostTitle()));
		}
	}


	@Override
	public List<MyBlogPostVO> selectBlBoList(PaginationInfoVO<MyBlogPostVO> pagingVO) {
		return blBoMapper.selectBlBoList(pagingVO);
	}


	@Override
	public int countBlBoList(PaginationInfoVO<MyBlogPostVO> pagingVO) {
		return blBoMapper.countBlBoList(pagingVO);
	}

}
