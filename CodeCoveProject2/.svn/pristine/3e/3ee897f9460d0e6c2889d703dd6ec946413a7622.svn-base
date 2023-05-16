package kr.or.ddit.mapper.attach;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.board.vo.CooFormVO;
import kr.or.ddit.board.vo.FreeBoardVO;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.expert.vo.ExpertProdVO;
import kr.or.ddit.mainpage.vo.NoticeVO;
import kr.or.ddit.mainpage.vo.QnAVO;
import kr.or.ddit.member.vo.ExpertVO;
import kr.or.ddit.project.work.vo.WorkVO;

@Mapper
public interface AttatchMapper {

	/**
	 * template(ExpertProuct) 게시글의 첨부파일 등록
	 * expertProductVO
	 */
	public void templateInsertAttatch(ExpertProdVO expertProdVO);

	
	/**
	 * 멘토신청 파일등록
	 * expertProductVO
	 */
	public void mentorInsertAttatch(ExpertVO expertVO);
	
	
	/**
	 * 파일 업로드
	 * 
	 * @param attatch
	 */
	public void insertAttatch(AttatchVO attatch);

	public void insertFolderAttatch(AttatchVO attatch);

	public void updateAttatch(AttatchVO attatch);

	/**
	 * 파일 다운로드
	 * 
	 * @param attatchNum
	 * @return
	 */
	public AttatchVO selectDownload(String attatchNum);

	/**
	 * 블로그 게시글의 첨부파일 등록
	 * 
	 * @param postVO
	 * @return
	 */
	public int insertBlogAttatches(MyBlogPostVO postVO);
	

	
	

	/**
	 * 공지사항 게시글 첨부파일 등록
	 * 
	 * @param notice
	 * @return
	 */
	// public int insertNoticeAttatches(NoticeVO notice);

	/**
	 * 자유게시판 게시글 첨부파일 등록
	 * 
	 * @param freeBoard
	 * @return
	 */
	 public int insertFreeBoardAttatches(FreeBoardVO freeBoard);

	/**
	 * 자유게시판 게시글 첨부파일 등록
	 * 
	 * @param freeBoard
	 * @return
	 */
	// public int insertCooBoardAttatches(CooBoardVO cooboard);

	public List<AttatchVO> selectAttatchNum(String attatchPlace);

	/**
	 * 해당 파일에 대한 정보 가져오기
	 * 
	 * @param attatch
	 * @return
	 */
	public AttatchVO selectAttatchFile(AttatchVO attatch);

	/**
	 * 첨부파일에 올라간 파일 지우기
	 * 
	 * @param attatch
	 */
	public void deleteAttatchFile(AttatchVO attatch);

	/**
	 * 파일 여러개 다운로드
	 * 
	 * @param attatch
	 * @return
	 */
	public AttatchVO multiDownload(AttatchVO attatch);

	public AttatchVO createFolderNum();

	public List<AttatchVO> selectAttatchFileList(AttatchVO attatch);

	public void insertReplyAttatch(AttatchVO attatch);

	public void insertIssueReplyAttatch(AttatchVO attatch);

	public void modifyIssueReplyAttatch(AttatchVO attatch);

	public void createAttachNumReplyAttatch(AttatchVO attatch);

	public String findAttachNum(String parentWoReplyNum);

	public AttatchVO selectAttatch(AttatchVO attatch);

	public void deleteAttatchReplaceFile(String attatchPlace);


	public void insertQnAAttatches(QnAVO qnaVO);


	public void insertCooBoardAttatches(CooBoardVO cooBoardVO);


	public void workInsertAttatch(WorkVO work);


	public void workFileDelete(AttatchVO attatch);

	public void insertNoticeAttatches(NoticeVO noticeVO);
	
	public void insertCooApplyAttatches(CooFormVO cooFormVO);


	public void cooFormFileDelete(String cooFormNum);


	public void workFileAllDelete(String workNum);

}
