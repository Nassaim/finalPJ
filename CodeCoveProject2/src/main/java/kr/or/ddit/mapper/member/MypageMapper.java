package kr.or.ddit.mapper.member;

import java.util.List;

import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.board.vo.FreeBoardVO;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.expert.vo.MyExpertVO;
import kr.or.ddit.mainpage.vo.QnAVO;
import kr.or.ddit.member.vo.ExpertVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.MyReplyVO;

public interface MypageMapper {

	List<MyExpertVO> totalList(MemberVO member);

	int progressUpdate(String epayNum);

	List<ExpertVO> mentorList(MemberVO member);

	int mentorInsert(ExpertVO expertVO);

	List<FreeBoardVO> myFreeList(String memId);

	List<CooBoardVO> myCooList(String memId);

	List<MyReplyVO> myReplyList(String memId);

	List<QnAVO> myQnaList(String memId);

	int updateMentorStatus(String memId);

	ExpertVO getMentorDetail(String memId);

	List<AttatchVO> getAttachFiles(String formNum);

	// 마이페이지 멘토신청 수정폼- 파일삭제
	void deleteFiles(AttatchVO delAtchVo);
	// 마이페이지 멘토신청 수정(modify)
	int mentorModify(ExpertVO expertVO);


}
