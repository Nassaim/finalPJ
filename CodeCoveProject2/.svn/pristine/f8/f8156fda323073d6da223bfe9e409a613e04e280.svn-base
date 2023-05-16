package kr.or.ddit.mainpage.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mainpage.service.NoticeService;
import kr.or.ddit.mainpage.vo.NoticeVO;
import kr.or.ddit.mainpage.vo.QnAVO;
import kr.or.ddit.mapper.admin.NoticeMapper;
import kr.or.ddit.mapper.attach.AttatchMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeMapper noticeMapper;
	
	@Inject
	private AttatchMapper attatchMapper;
	
	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
	private void processAttatches(NoticeVO noticeVO) throws IOException {
		List<AttatchVO> attatchList = noticeVO.getAttatchList();
		if (attatchList == null || attatchList.isEmpty()) {
			return;
		}
		
		attatchMapper.insertNoticeAttatches(noticeVO);
		
		for(AttatchVO attatch : attatchList) {
			MultipartFile file = attatch.getAttatchFile();
			attatch.saveTo(saveFolder);
		}
	}

	@Override
	public List<NoticeVO> selectNoticeList(PaginationInfoVO<NoticeVO> pagingVO) {
		return noticeMapper.selectNoticeList(pagingVO);
	}

	@Override
	public NoticeVO readNotice(String notiNum) {
		noticeMapper.incrementView(notiNum);
		return noticeMapper.readNotice(notiNum);
	}

	@Override
	public int registerNotice(NoticeVO noticeVO) {
		try {
			processAttatches(noticeVO);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		int cnt = noticeMapper.registerNotice(noticeVO);
		
		return cnt;
	}
	
}
