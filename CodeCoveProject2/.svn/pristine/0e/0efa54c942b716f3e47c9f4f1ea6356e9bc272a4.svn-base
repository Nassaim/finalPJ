package kr.or.ddit.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.CreateBlogVO;
import kr.or.ddit.expert.vo.MyExpertVO;
import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService {
	public ServiceResult idCheck(String memId);

	public String passCheck(String memId, String memPass);

	public ServiceResult signup(HttpServletRequest req, MemberVO memberVO);

	public MemberVO loginCheck(MemberVO member);

	public String idForgetProcess(MemberVO member);

	public String pwForgetProcess(MemberVO member);

	public MemberVO selectMember(MemberVO sessionMember);

	public ServiceResult profileUpdate(HttpServletRequest req, MemberVO memberVO);
	
	//이메일발송
	public void sendEmail(MemberVO member, String div) throws Exception;
	
	// 회원가입시 블로그 생성
	public void createBlog(CreateBlogVO createBlog);
	public void createBlogCategory(BlogCateVO blogCate);

	
	public List<MyExpertVO> totalList(MemberVO member);

	public ServiceResult passUpdate(MemberVO memberVO);

	// 유저 탈퇴(insert)
	public ServiceResult userWithdraw(String memId);

	// 탈퇴유저 확인(login)
	public int checkWithdrawId(String memId);


}
