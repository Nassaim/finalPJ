package kr.or.ddit.project.issue.service;


import java.util.List;

import kr.or.ddit.project.issue.vo.IssueVO;

public interface IIssueService {
	public IssueVO register(IssueVO issue);
	public List<IssueVO> list(IssueVO issue);
	public List<IssueVO> issueList(String workNum);
	public void delete(String issueNum);
	public void allDelete(String workNum);
}
