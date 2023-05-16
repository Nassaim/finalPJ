package kr.or.ddit.mapper.blog;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.common.PaginationInfoVO;


@Mapper
public interface BlogListMapper {

	public int latestBlogRecord();

	public List<MyBlogPostVO> latestBlogList(PaginationInfoVO<MyBlogPostVO> pagingVO);

	public List<MyBlogPostVO> trendBlogList();

	public int searchBlogRecord(PaginationInfoVO<MyBlogPostVO> pagingVO);

	public List<MyBlogPostVO> searchBlogList(PaginationInfoVO<MyBlogPostVO> pagingVO);
}
