package kr.or.ddit.mainpage.service;

import java.util.List;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mainpage.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVO);

	public NoticeVO readNotice(String notiNum);

	public int registerNotice(NoticeVO noticeVO);

}
