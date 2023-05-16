package kr.or.ddit.mapper.member;

import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.CreateBlogVO;
import kr.or.ddit.member.vo.MemberRole;
import kr.or.ddit.member.vo.MemberVO;

public interface LoginMapper {
	public MemberVO idCheck(String memId);

	public int signup(MemberVO memberVO);

	public MemberVO loginCheck(MemberVO member);

	public String idForgetProcess(MemberVO member);

//	public String pwForgetProcess(MemberVO member);
	// 랜덤 비밀번호 생성
	public void updatePw(MemberVO member);

	public void signupRole(MemberRole memberRole);
	
	// 회원가입시 블로그 생성
	public void createBlog(CreateBlogVO createBlog);
	public void createBlogCategory(BlogCateVO blogCate);

	// 로그인 시 탈퇴회원 확인하긔
	public int checkWithdrawId(String memId);


}
