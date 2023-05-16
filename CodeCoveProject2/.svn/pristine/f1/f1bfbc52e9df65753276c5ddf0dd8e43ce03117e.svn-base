package kr.or.ddit.common;

import javax.inject.Inject;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.RoleGroup;
import kr.or.ddit.common.exception.NotAuthorityException;
import kr.or.ddit.mapper.admin.MemberManagementMapper;
import kr.or.ddit.member.vo.MemberPrincipal;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Service
public class CheckMember {

	@Inject
	private MemberManagementMapper memberDAO;

	public MemberVO checkAdmin() {
		if (SecurityContextHolder.getContext().getAuthentication().isAuthenticated()
				&& !SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			MemberVO mv = ((MemberPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal())
					.getRealMember();
			if (memberDAO.checkAdmin(mv.getMemId()) == 1) {
				return mv;

			} else {
				throw new NotAuthorityException();
			}

		} else {
			return null;
		}
	}

	public RoleGroup checkBlog(String memId) {
		RoleGroup owner = null;
//		시큐리티 구현 필요
//		if (SecurityContextHolder.getContext().getAuthentication().isAuthenticated()
//				&& !SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
//			MemberVO mv = ((MemberPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal())
//					.getRealMember();
//
//			if (mv.getMemId().equals(memId)) {
//				return owner = RoleGroup.OWNER;
//			}
//
//			if (!mv.getMemId().equals(memId)) {
//				return owner = RoleGroup.NOTOWNER;
//			}
//
//		} else {
//			return owner = RoleGroup.GUEST;
//		}

//		return owner;
		return RoleGroup.OWNER;
	}
}
