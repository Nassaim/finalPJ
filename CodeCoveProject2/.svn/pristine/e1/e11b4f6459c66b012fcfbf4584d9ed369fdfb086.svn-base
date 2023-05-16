package kr.or.ddit.member.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

public class MemberPrincipal extends User {

	private MemberVO realMember;

	public MemberPrincipal(MemberVO realMember) {
		super(realMember.getMemId(), realMember.getMemPass(),
				AuthorityUtils.createAuthorityList(realMember.getRoleListArray()));
		this.realMember = realMember;
	}

	public MemberVO getRealMember() {
		return realMember;
	}
}
