package kr.or.ddit.project.issue.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class IssueVO {
	private String issueNum;
	private String workNum;
	private String issueContent;
	private String issueDate;
	private String IssueReq;
}
