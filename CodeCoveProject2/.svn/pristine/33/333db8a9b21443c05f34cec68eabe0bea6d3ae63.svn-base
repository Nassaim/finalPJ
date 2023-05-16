package kr.or.ddit.member.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {
	private String memId;
	private String memPass;
	private String memName;
	private String memNick;
	private String memMail;
	private String memHP;
	private String report;
	private String memexpYn;
	private String memProfile ="/resources/images/basicProfile.png";
	private MultipartFile imgFile;

	private List<MemberRole> roleList; // 회원권한목록

	private String blackContent;
	private String blackDate;

	public String[] getRoleListArray() {
		String[] array = null;
		if (roleList != null) {
			array = new String[roleList.size()];
			for (int i = 0; i < roleList.size(); i++) {
				array[i] = roleList.get(i).getRoleCode();
			}
		}
		return array;
	}

}
