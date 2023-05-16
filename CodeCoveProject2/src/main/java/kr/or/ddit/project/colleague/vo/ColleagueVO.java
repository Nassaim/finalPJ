package kr.or.ddit.project.colleague.vo;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.board.vo.CooFormVO;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.member.vo.MemberVO;
import lombok.Data;

@Data
public class ColleagueVO {
	private String colNum;
	private String pjId;
	private String cooFormNum;
	private String memId;
	private String colDate;
	private String colResignYn;
	private String pjAuthCode;
	private String workRoleCode;
	private String colProfile;

	private String memName;
	private String memNick;
	private String memMail;
	private String memProfile;
	private String memHp;
	
	private String workNum;
	
	private String cooNm;
	private String cooFormContent;
	private String cooFromDate;
	
	private String attatchNum;
	private transient List<AttatchVO> attatchList;
	private CooFormVO cooFormFile;

	private MultipartFile cooImage;
	private String cooProfile;

	private String crName;

	public void setCooImage(MultipartFile cooImage) {
		this.cooImage = cooImage;
		if (cooImage != null && !cooImage.isEmpty()) {
			this.cooProfile = UUID.randomUUID().toString();
		}
	}

	public void saveTo(File saveFolder) {
		if (cooImage != null)
			try {
				File newfile = new File(saveFolder, cooProfile);
				cooImage.transferTo(newfile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	private MemberVO member;

	// TODO: 검색 기능 추가 해야됨

}
