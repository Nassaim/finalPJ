package kr.or.ddit.member.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.CreateBlogVO;
import kr.or.ddit.expert.vo.MyExpertVO;
import kr.or.ddit.mapper.member.LoginMapper;
import kr.or.ddit.mapper.member.MypageMapper;
import kr.or.ddit.mapper.member.ProfileMapper;
import kr.or.ddit.member.vo.MemberRole;
import kr.or.ddit.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements IMemberService {

	@Inject
	private LoginMapper loginMapper;

	@Inject
	private ProfileMapper profileMapper;
	
	@Inject
	private MypageMapper mypageMapper;

	@Override
	public ServiceResult idCheck(String memId) {
		ServiceResult result = null;
		MemberVO member = loginMapper.idCheck(memId);
		if (member != null) {
			result = ServiceResult.EXIST;
		} else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}

	@Override
	public String passCheck(String memId, String memPass) {
		
		String result = "";
		
		MemberVO member = profileMapper.passCheck(memId);
		
		if(member.getMemPass().equals(memPass)) {
			result = "ok";
		} else {
			result = "no";
		}
		
		return result;
	}
	
	@Override
	public ServiceResult signup(HttpServletRequest req, MemberVO memberVO) {
		ServiceResult result = null;

		//파일
		String uploadPath = req.getServletContext().getRealPath("/resources/profile");
		File file = new File(uploadPath);
		if (!file.exists()) {
			file.mkdirs();
		}

		String profileImg = "";
		try {
			MultipartFile profileImgFile = memberVO.getImgFile();
			
//			System.out.println("사진 확인 >>" + profileImgFile);
			
			if (profileImgFile != null && !profileImgFile.getOriginalFilename().equals("")) {
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + profileImgFile.getOriginalFilename();
				uploadPath += "/" + fileName;
				profileImgFile.transferTo(new File(uploadPath));
				profileImg = "/resources/profile/" + fileName;
				memberVO.setMemProfile(profileImg);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 파일 부분 끝
		
		int status = loginMapper.signup(memberVO);
		
		MemberRole memberRole = new MemberRole();
		memberRole.setMemId(memberVO.getMemId());
		memberRole.setRoleCode("ROLE_USER");
		loginMapper.signupRole(memberRole);
		
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public MemberVO loginCheck(MemberVO member) {
		return loginMapper.loginCheck(member);
	}

	@Override
	public String idForgetProcess(MemberVO member) {
		return loginMapper.idForgetProcess(member);
	}

	@Override
	public String pwForgetProcess(MemberVO member) {
		
		String result = "";
		
		MemberVO memCheck = loginMapper.idCheck(member.getMemId());
		
		System.out.println("가져온멤" + member.getMemName() + "찾은멤" + memCheck.getMemName());
		System.out.println("가져온멤" + member.getMemMail() + "찾은멤" + memCheck.getMemMail());
		
		if (!member.getMemName().equals(memCheck.getMemName()) || !member.getMemMail().equals(memCheck.getMemMail())) {
			result = "wrong"; // 이름 & 비밀번호 틀릴 시
			System.out.println("틀렷네요 ");
			
			return result;
		}
		
//		String checkId = loginMapper.idForgetProcess(member); // 이름 + 이메일 = 아이디
		
//		if (member.getMemId())
			
		System.out.println("여긴 작동안하는가");
		
		String ranPw = "";
		for (int i = 0; i < 12; i++) {
			ranPw += (char) ((Math.random() * 26) + 97);
		}
		
		member.setMemPass(ranPw);
		
		// 비밀번호 변경
		loginMapper.updatePw(member);
		
		// 비밀번호 변경 메일 발송
		
		try {
			sendEmail(member, "findpw");
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		result = "ok"; // 맞는 정보일시 이메일 발송
		
		return result;
	}

	@Override
	public MemberVO selectMember(MemberVO sessionMember) {
		return profileMapper.selectMember(sessionMember);
	}

	@Override
	public ServiceResult profileUpdate(HttpServletRequest req, MemberVO memberVO) {
		ServiceResult result = null;

		String uploadPath = req.getServletContext().getRealPath("/resources/profile");
		File file = new File(uploadPath);
		if (!file.exists()) {
			file.mkdirs();
		}

		String profileImg = "";
		try {
			MultipartFile profileImgFile = memberVO.getImgFile();
			if (profileImgFile.getOriginalFilename() != null && !profileImgFile.getOriginalFilename().equals("")) {
				String fileName = UUID.randomUUID().toString();
				fileName += "_" + profileImgFile.getOriginalFilename();
				uploadPath += "/" + fileName;
				profileImgFile.transferTo(new File(uploadPath));
				profileImg = "/resources/profile/" + fileName;
			}
			memberVO.setMemProfile(profileImg);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		int status = profileMapper.profileUpdate(memberVO);
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}
	
	// 회원가입시 블로그 생성
	@Override
	public void createBlog(CreateBlogVO createBlog) {
		loginMapper.createBlog(createBlog);
	}

	@Override
	public void createBlogCategory(BlogCateVO blogCate) {
		loginMapper.createBlogCategory(blogCate);
	}

	@Override
	public void sendEmail(MemberVO member, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "keepmm@naver.com";
		String hostSMTPpwd = "fkffkfk8993";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "keepmm@naver.com";
		String fromName = "coco";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "CoCo 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getMemId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getMemPass() + "</p></div>";

		}
		
		
		// 받는 사람 E-Mail 주소
		String mail = member.getMemMail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시 587 // 465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
	}

	@Override
	public List<MyExpertVO> totalList(MemberVO member) {
		return mypageMapper.totalList(member);
	}

	@Override
	public ServiceResult passUpdate(MemberVO memberVO) {
		ServiceResult result = null;

		int status = profileMapper.passUpdate(memberVO);
		
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public ServiceResult userWithdraw(String memId) {
		ServiceResult result = null;
		
		int status = profileMapper.userOut(memId);
		
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
		
	}

	@Override
	public int checkWithdrawId(String memId) {
		return loginMapper.checkWithdrawId(memId);
	}


	


}
