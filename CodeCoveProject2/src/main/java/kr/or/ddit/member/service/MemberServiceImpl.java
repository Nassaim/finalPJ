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
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		
		log.debug("가져온멤버 이름" + member.getMemName() + "찾은멤버" + memCheck.getMemName());
		log.debug("가져온멤버 메일" + member.getMemMail() + "찾은멤버" + memCheck.getMemMail());
		
		if (!member.getMemName().equals(memCheck.getMemName()) || !member.getMemMail().equals(memCheck.getMemMail())) {
			log.debug("이름 & 비밀번호 틀림");
			result = "wrong"; // 이름 & 비밀번호 틀릴 시
			return result;
		}
		
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
			subject = "CodeCove 임시 비밀번호 입니다.";
			
			msg += "<!DOCTYPE html>\r\n";
			msg += "<html lang=\"ko\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n";
			msg += "\r\n" + "\r\n";
			msg += "<head style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n";
			msg += "    <meta charset=\"utf-8\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n";
			msg += "    <title style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\"></title>\r\n";
			msg += "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n";
			msg += "    \r\n";
			msg += "    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js\" charset=\"utf-8\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\"></script>\r\n";
			msg += "</head>\r\n" + "\r\n";
			msg += "<body style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;background: #f3f5ff;min-height: 100vh;display: flex;align-items: center;justify-content: center;\">\r\n";
			msg += "<div style=\"width: 80vh;margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;background: #f3f5ff;min-height: 60vh;display: flex;align-items: center;justify-content: center;\">\r\n";
			msg += "    <div class=\"login-form\" style=\"margin: 0;padding: 30px 60px;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;width: 470px;background: #ffffff;\">\r\n";
			msg += "\r\n";
			msg += "        <form action=\"\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n";
			msg += "            <div class=\"textbox\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;width: 100%;height: 50px;position: relative;margin-top: 15px;\">\r\n";
			msg += "                <h3 style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;color: #000000;\"><p><span style='font-size:16px'>CodeCove</span><br/>"+member.getMemId()+"님의 임시비밀번호 발급</p></h3>\r\n";
			msg += "            </div>\r\n";
			msg += "            <div value=\" \" class=\"login-btn\" disabled style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;width: 100%;height: 65px;margin-top: 30px;background: #ccd5ff;border: none;outline: none;font-weight: 700;color: #f1f1f1;transition: .3s linear;\">\r\n";
			msg += "                <br>\r\n" + "                <a ";
			msg += "' style=\"margin:20px 0; padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;font-size: 16px;color: #581cff;\">" + member.getMemPass() + "</a>\r\n";
			msg += "            </div>\r\n" + "        </form>\r\n";
			msg += "        <div class=\"dont-have-account\" style=\"margin: 20px 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;font-size: 16px;color: #000000;\">\r\n";
			msg += "            비밀번호를 변경하여 사용하세요.<br>\r\n";
			msg += "            <a href=\"http://192.168.34.58/coco/login\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;color: #000000;font-size: 12px;\">로그인하러 가기</a>\r\n";
			msg += "        </div>\r\n" + "\r\n";
			msg += "        <div style=\"font-size: 11px;color: #000000;background-color: #f3f5ff;line-height: 1.3em;padding: 10px 30px;margin-top: 30px;margin: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;\">\r\n";
			msg += "            본 메일은 발신 전용이므로 답변으로 문의는 불가능합니다.<br>\r\n" + "            다른 궁금하신 사항은 웹사이트(\r\n";
			msg += "            <a href=\"http://192.168.34.58/coco/loginSuccess\" target=\"_blank\" style=\"margin: 0;padding: 0;box-sizing: border-box;font-family: &quot;hind&quot;, sans-serif;text-decoration: none;text-align: center;color: 581cff;\">메인화면 상단</a>\r\n";
			msg += "            )의 FAQ에서 확인 또는 Q&A에서 문의해 주세요.<br>Copyright 2023 All rights reserved.\r\n" + "        </div>\r\n";
			msg += "</div></div></body>\r\n" + "</html>";;

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
