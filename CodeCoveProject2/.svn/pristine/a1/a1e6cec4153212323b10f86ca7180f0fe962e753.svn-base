package kr.or.ddit.mainpage.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.AttatchVO;
import lombok.Data;

@Data
public class NoticeVO {

	private String notiNum;
	private String pjId;
	private String writerId;
	private String notiTitle;
	private String notiContent;
	private int viewNum;
	private String notiClassCode;
	private String notiDelYn;
	private Date notiDate;
	
	private int totalCnt;
	
	private List<AttatchVO> attatchList;
	private List<AttatchVO> attatchNums;
	private List<ComCodeVO> codeList;
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
	
}
