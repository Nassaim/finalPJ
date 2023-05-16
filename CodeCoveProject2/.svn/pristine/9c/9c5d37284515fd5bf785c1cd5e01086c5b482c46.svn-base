package kr.or.ddit.mapper.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.project.issue.vo.IssueVO;

@Mapper
public interface IIssueMapper {
	public int register(IssueVO issue);
	public List<IssueVO> list(IssueVO issue);
	public List<IssueVO> issueList(String workNum);
	public IssueVO detail(String issueNum);
	public void delete(String issueNum);
	public void allDelete(String workNum);
}
