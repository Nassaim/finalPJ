package kr.or.ddit.blog.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BlogHeartVO {
	private String heartNum;
	private String postNum;
	private String memId;
}
