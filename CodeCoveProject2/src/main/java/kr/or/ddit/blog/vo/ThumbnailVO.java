package kr.or.ddit.blog.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(exclude = "postContent")
public class ThumbnailVO {
	private String postNum;
	private String cateNum;
	private String memId;
	private String postTitle;
	private String postContent;
	private Integer postView;
	private Integer postHeart;
	private String postBlind;
	private String postDate;
	private String postPublic;
	private String postTag;
	private String attatchNum;
}
