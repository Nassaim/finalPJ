package kr.or.ddit.blog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mapper.blog.BlogListMapper;

@Service
public class BlogListServiceImpl implements BlogListService {
	
	@Inject
	private BlogListMapper blogMapper;

	@Override
	public void retrieveLatestList(PaginationInfoVO<MyBlogPostVO> pagingVO) {
		pagingVO.setTotalRecord(blogMapper.latestBlogRecord());
       	List<MyBlogPostVO> postList = blogMapper.latestBlogList(pagingVO);
       	pagingVO.setDataList(postList);
       	
	}
	
	@Override
	public List<MyBlogPostVO> retrieveTrendList() {
		List<MyBlogPostVO> trendList = blogMapper.trendBlogList();
		return trendList;
	}

	@Override
	public void retrieveSearchList(PaginationInfoVO<MyBlogPostVO> pagingVO) {
		pagingVO.setTotalRecord(blogMapper.searchBlogRecord(pagingVO));
       	List<MyBlogPostVO> postList = blogMapper.searchBlogList(pagingVO);
       	pagingVO.setDataList(postList);
	}
	
	
}
