package kr.or.ddit.blog.vo;

import javax.validation.constraints.Size;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "calNum" })
public class MyCalendarVO {
	private String calNum;
	private String blogId;
	@Size(min = 1, max = 50)
	private String calTitle;
	private String calStartDate;
	private String calEndDate;
	private String calContent;
	private String calColor;

	private String bloggerId;

}
