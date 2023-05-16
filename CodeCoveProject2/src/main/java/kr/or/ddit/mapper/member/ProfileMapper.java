package kr.or.ddit.mapper.member;

import kr.or.ddit.member.vo.MemberVO;

public interface ProfileMapper {

	MemberVO selectMember(MemberVO sessionMember);

	int profileUpdate(MemberVO memberVO);

	MemberVO passCheck(String memId);

	int passUpdate(MemberVO memberVO);

	int userOut(String memId);
}
