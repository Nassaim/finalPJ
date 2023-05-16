package kr.or.ddit.member.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import kr.or.ddit.admin.vo.ComCodeVO;
import kr.or.ddit.common.AttatchVO;
import lombok.Data;

@Data
public class ExpertVO {
	
	// TB_EXPERT_FORM
	private String expFormNum;		// 신청번호
	private String formId;			// 회원아이디
	private String expFormContent;	// 자기소개
	private String expFormAssume;	//포트폴리오링크
	private String expApprCode;	// 접수코드
	private String expRefuse;	// 거절이유
	private Date expRegDate;	//신청일
	private String expJobMajor; // 주요직무
	private String expJobLevel; // 경력기간
	private String expJobCurrent; // 현재직업
	
	
	// 첨부파일
	private String memId;	// 첨부파일용 멤버아이디
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

	private transient List<AttatchVO> attatchList;

	private List<String> postNumList;
	private List<AttatchVO> attatchNums;

	private Object jsonContents;	
	private String delList; // modifyMentor 수정용(index 번호)
	
	
	
	// TB_EXPERT
	private String expertId;
	private String presentation;
	private String assume;
	private int accumRep;
	private String expTag;
	private String expDelYn;

	
	
	// EXPERT_FORM JOIN에 필요한 VO들
	private String RNUM;			// 신청서 순번
	private String comCodeNm;		// 공통코드내용
	private String memName;			// 회원 이름
	private String memNick;			// 회원 별명
	private String memMail;			// 회원 메일
	private String memHP;			// 회원 연락처
	
	private List<ComCodeVO> codeList;
	private List<MemberVO> memberList;
}
