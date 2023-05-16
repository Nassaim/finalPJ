package kr.or.ddit.blog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.blog.vo.BlogReplyVO;
import kr.or.ddit.mapper.blog.BlogReplyMapper;

@Service
public class BlogReplyServiceImpl implements BlogReplyService {
	@Inject
	private BlogReplyMapper replyMapper;

//	알림 추가
//	@Inject
//	private NewsMapper newsMapper;

	// 해당게시글에 있는 댓글 조회
	@Override
	public List<BlogReplyVO> retrieveReplyList(String postNum) {
		List<BlogReplyVO> replyList = replyMapper.selectReplyList(postNum);
		return replyList;
	}

	// 댓글 추가
	@Override
	public String createReply(BlogReplyVO blogReplyVO) {
		int cnt = replyMapper.insertReply(blogReplyVO);
		String msg = null;
		if (cnt > 0) {
//			알림 추가
//			NewsVO newsVO = new NewsVO();
//			newsVO.setReceiverId(blogReplyVO.getBlogerId());
//			newsVO.setNewsMsgCode(ComCode.NEW05.toString());
//			newsVO.setNewsId(blogReplyVO.getPostNum());
//			newsMapper.insertNews(newsVO);
			msg = "성공";
		} else {
			msg = "실패";
		}
		return msg;
	}

	// 대댓글 추가
	@Override
	public String createReReply(BlogReplyVO blogReplyVO) {
		int cnt = replyMapper.insertReReply(blogReplyVO);
		String msg = null;
		if (cnt > 0) {
//			알림 추가
//			NewsVO newsVO = new NewsVO();
//			newsVO.setPostId(blogReplyVO.getBlogerId());
//			newsVO.setReceiverId(blogReplyVO.getOwnerWriter());
//			newsVO.setNewsMsgCode(ComCode.NEW06.toString());
//			newsVO.setNewsId(blogReplyVO.getPostNum());
//			newsMapper.insertNews(newsVO);
			msg = "성공";
		} else {
			msg = "실패";
		}
		return msg;
	}

	// 댓글 수정
	@Override
	public String modifyReply(BlogReplyVO blogReplyVO) {
		int cnt = replyMapper.updateReply(blogReplyVO);
		String msg = null;
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		return msg;
	}

	// 댓글 삭제
	@Override
	public String removeReply(String delNum) {
		int cnt = replyMapper.deleteReply(delNum);
		String msg = null;
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		return msg;
	}
}
