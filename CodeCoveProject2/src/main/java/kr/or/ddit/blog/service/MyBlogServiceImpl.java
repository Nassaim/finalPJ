package kr.or.ddit.blog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.blog.vo.TodoVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.common.exception.NotAuthorityException;
import kr.or.ddit.common.exception.NotFoundException;
import kr.or.ddit.mapper.blog.MyBlogMapper;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyBlogServiceImpl implements MyBlogService {
	@Inject
	MyBlogMapper myBlogMapper;

	/**
	 * 블로그 카테고리 조회
	 */
	@Override
	public List<BlogCateVO> retrieveCate(String memId) {
		List<BlogCateVO> blogCateList = myBlogMapper.selectCate(memId);
		return blogCateList;
	}

	/**
	 * 블로그 사용자 확인
	 */
	@Override
	public int checkMemId(String memId) {
		int cnt = myBlogMapper.selectMemId(memId);
		return cnt;
	}

	/**
	 * 블로그 리스트
	 * 
	 * @throws ParseException
	 */
	@Override
	public void retrievePostList(Map<String, Object> map, PaginationInfoVO<MyBlogPostVO> pagingVO)
			throws ParseException {
		pagingVO.setTotalRecord(myBlogMapper.selectTotalPostRecord(map));
		List<MyBlogPostVO> postList = myBlogMapper.selectPostList(map);

		JSONParser parser = new JSONParser();
		for (int i = 0; i < postList.size(); i++) {
			String strCt = postList.get(i).getPostContent();

			JSONObject jsonObject = (JSONObject) parser.parse(strCt);
			Object blocks = jsonObject.get("blocks");

			postList.get(i).setJsonContents(blocks);
		}

		pagingVO.setDataList(postList);

	}

	/**
	 * 블로그 게시글 조회
	 */
	@Override
	public MyBlogPostVO retrievePost(String memId, String postNum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("postNum", postNum);

		MyBlogPostVO post = myBlogMapper.selectPost(map);

		if (post == null) {
			throw new NotFoundException();
		}

		sendError(post);
		if (StringUtils.equals(post.getPostPublicYn(), "N")) {
			throw new NotAuthorityException();
		}

		myBlogMapper.incrementHit(postNum);
		return post;
	}

	public void sendError(MyBlogPostVO post) {
		if (StringUtils.equals(post.getPostBlindYn(), "Y")) {
			throw new NotFoundException(String.format("'%s' 게시글은 차단된 게시글입니다.", post.getPostTitle()));
		} else if (StringUtils.equals(post.getPostDelYn(), "Y")) {
			throw new NotFoundException(String.format("'%s' 게시글이 없습니다.", post.getPostTitle()));
		}
	}

	// 게시글 비공개 처리
	@Transactional
	@Override
	public ServiceResult postPrivate(Map<String, String> map) {

		int privatePost = myBlogMapper.privatePost(map);
		ServiceResult result = null;

		if (privatePost > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}

		return result;
	}

	@Transactional
	@Override
	public ServiceResult delPost(String memId, String postNum) {
		int delPost = myBlogMapper.delPost(postNum);
		ServiceResult result = null;

		if (delPost > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}

		return result;
	}

	@Override
	public List<TodoVO> retrieveTodo(Map<String, String> map) {
		List<TodoVO> todoList = myBlogMapper.selectTodoList(map);
		return todoList;
	}

	@Transactional
	@Override
	public ServiceResult addTodo(TodoVO todo) {
		int insertTodo = myBlogMapper.insertTodo(todo);
		ServiceResult result = null;

		if (insertTodo > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}

		return result;
	}

	@Transactional
	@Override
	public ServiceResult upTodo(TodoVO todo) {
		int upTodo = myBlogMapper.updateTodo(todo);
		ServiceResult result = null;

		if (upTodo > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}

		return result;
	}

	@Transactional
	@Override
	public ServiceResult ynTodo(TodoVO todo) {
		int upYN = myBlogMapper.updateYn(todo);
		ServiceResult result = null;

		if (upYN > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}

		return result;
	}

	@Transactional
	@Override
	public ServiceResult delTodo(String checkNum) {
		int delTodo = myBlogMapper.delTodo(checkNum);
		ServiceResult result = null;

		if (delTodo > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}

		return result;
	}

}
