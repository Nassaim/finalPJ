package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.board.vo.FreeBoardVO;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.mainpage.vo.QnAVO;
import kr.or.ddit.member.vo.ExpertVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.MyReplyVO;

public interface IMypageService {

	// 상태 업데이트
	public ServiceResult progressUpdate(String epayNum);

	// 멘토신청내역리스트
	public List<ExpertVO> totalList(MemberVO member);

	// 멘토신청
	public int mentorInsert(ExpertVO expertVO);

	// 커뮤니티 자유게시판
	public List<FreeBoardVO> selectMyFree(String memId);
	// 커뮤니티 협업게시판
	public List<CooBoardVO> selectMyCoo(String memId);

	public List<MyReplyVO> selectMyReply(String memId);

	public List<QnAVO> selectMyQna(String memId);

	// 멘토 디테일
	public ExpertVO getMentorDetail(String memId);
	// 파일 디테일
	public List<AttatchVO> getAttachFiles(String formNum);

	public ServiceResult mentorModify(ExpertVO expertVO);

	
}
