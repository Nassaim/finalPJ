package kr.or.ddit.blog.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.AttatchVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "postNum")
@ToString(exclude = { "postContent" })
public class MyBlogPostVO {

	private Integer rnum;
	private String postNum;
	@NotBlank(message = "카테고리는 필수 선택값입니다.")
	private String postCateNum;
	private String bloggerId;
	@NotBlank(message = "제목은 필수 입력값입니다.")
	private String postTitle;
	@NotBlank
	private String postContent;
	private int postView;
	private int postHeart;
	private String postDate;
	private String postBlindYn;
	private String postPublicYn;
	private String postDelYn;
	private String postTag;
	private String attatchNum;
	private String thumbnail;
	private String cateNum;
	private String cateNm;
	private String memNick;

	private MultipartFile[] postFiles;

	public void setPostFiles(MultipartFile[] postFiles) {
		if (postFiles == null || postFiles.length == 0)
			return;
		this.postFiles = postFiles;
		this.attatchList = new ArrayList<>();
		for (MultipartFile single : postFiles) {
			if (single.isEmpty())
				continue;
			attatchList.add(new AttatchVO(single));
		}
	}

	private transient List<AttatchVO> attatchList;

	private List<String> postNumList;
	private List<AttatchVO> attatchNums;

	private Object jsonContents;
}
