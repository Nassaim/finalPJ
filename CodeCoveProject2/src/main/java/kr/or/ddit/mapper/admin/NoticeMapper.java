package kr.or.ddit.mapper.admin;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mainpage.vo.NoticeVO;

@Mapper
public interface NoticeMapper {

	public List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVO);

	public NoticeVO readNotice(String notiNum);

	public void incrementView(String notiNum);

	public int registerNotice(NoticeVO noticeVO);

}
