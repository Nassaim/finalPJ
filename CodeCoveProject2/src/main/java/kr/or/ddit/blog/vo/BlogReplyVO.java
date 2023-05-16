package kr.or.ddit.blog.vo;

import java.util.List;

import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class BlogReplyVO {
	private Integer rnum;
	private String blReplyDelYn;
	private String blReplyNum;
	private String postNum;
	private String blReplyWriter;

	@Size(min = 1, max = 150)
	private String blReplyContent;
	private String blReplyDate;
	private String parentBlReplyNum;

	private String postTitle;
	private String bloggerId;
	private List<String> blReplyNumList;

	// 대댓글시 필요한 댓글의 Id
	private String ownerWriter;
}
