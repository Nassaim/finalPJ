package kr.or.ddit.board.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.AttatchVO;
import lombok.Data;

@Data
public class CooFormVO {
	private String cooFormNum;			//협업신청번호
	private String applicantId;         //회원아이디
	private String cooNm;               //협업번호
	private String cooFormContent;      //자기소개
	private String cooAssumeAttatch;    //협업신청첨부파일

	//첨부파일
	private List<AttatchVO> attatchList;
	private String attatchNum;
	private List<String> postNumList;
	private List<AttatchVO> attatchNums;
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

	private Object jsonContents;
	
}