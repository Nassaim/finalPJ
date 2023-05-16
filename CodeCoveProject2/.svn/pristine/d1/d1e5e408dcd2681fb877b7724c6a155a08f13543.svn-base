package kr.or.ddit.project.issue.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.project.IIssueMapper;
import kr.or.ddit.project.issue.vo.IssueVO;

@Service
public class IssueServiceImpl implements IIssueService {

	@Inject
	private IIssueMapper issueMapper;
	
	@Override
	public IssueVO register(IssueVO issue) {
		
		int cnt = issueMapper.register(issue);
		if(cnt > 0) {
			issue = issueMapper.detail(issue.getIssueNum());
		}
		return issue;
	}

	@Override
	public List<IssueVO> list(IssueVO issue) {
		return issueMapper.list(issue);
	}

	@Override
	public List<IssueVO> issueList(String workNum) {
		return issueMapper.issueList(workNum);
	}

	@Override
	public void delete(String issueNum) {
		issueMapper.delete(issueNum);
	}

	@Override
	public void allDelete(String workNum) {
		issueMapper.allDelete(workNum);
		
	}
}
