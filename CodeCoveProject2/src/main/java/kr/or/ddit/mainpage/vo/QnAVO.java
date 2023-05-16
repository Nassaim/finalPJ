package kr.or.ddit.mainpage.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.member.vo.MemberVO;
import lombok.Data;

@Data
public class QnAVO {
	private String RNUM;
	
	private String qnaNum;
	private String writerId;
	private String qnaTitle;
	private String qnaContent;
	private String qnaPass;
	private String qnaPublicYn;
	private String answerTitle;
	private String answerContent;
	private String viewNum;
	private String answerId;
	private String delYn;
	private Date qnaDate;
	private Date answerDate;
	private String memId;
	
	private List<AttatchVO> attatchList;
	private List<AttatchVO> attatchNums;
	private List<ComCodeVO> codeList;
	private List<MemberVO> memList;
	private String attatchNum;
	
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

	private Object jsonObject;

	public String getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(String qnaNum) {
		this.qnaNum = qnaNum;
	}
	
	
	
	
}
