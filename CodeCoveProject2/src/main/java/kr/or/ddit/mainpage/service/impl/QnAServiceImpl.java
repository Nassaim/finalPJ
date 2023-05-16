package kr.or.ddit.mainpage.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mainpage.service.QnAService;
import kr.or.ddit.mainpage.vo.QnAVO;
import kr.or.ddit.mapper.admin.QnAMapper;
import kr.or.ddit.mapper.attach.AttatchMapper;
import kr.or.ddit.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QnAServiceImpl implements QnAService {

	@Inject
	private QnAMapper qnaMapper;
	
	@Inject
	private AttatchMapper attatchMapper;
	
	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
	@Override
	public int registerQnABoard(QnAVO qnaVO) {
		try {
			processAttatches(qnaVO);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		if(qnaVO.getQnaPublicYn() == null) {
			qnaVO.setQnaPublicYn("Y");
		}
		
		int cnt = qnaMapper.registerQnA(qnaVO);
		
		return cnt;
	}
	
	@Override
	public int countQnAList(PaginationInfoVO<QnAVO> pagingVO) {
		return qnaMapper.countQnAList(pagingVO);
	}
	
	@Override
	public List<QnAVO> selectQnABoardList(PaginationInfoVO<QnAVO> pagingVO) {
		return qnaMapper.selectQnABoardList(pagingVO);
	}
	
	@Override
	public QnAVO readQnA(String qnaNum) {
		qnaMapper.incrementView(qnaNum);
		return qnaMapper.readQnA(qnaNum);
	}
	
	
	@Override
	public int registerAnswer(String answerId, String answerContent, String qnaNum) {
		return qnaMapper.registerAnswer(answerId, answerContent, qnaNum);
	}

	
	
	
	
	
	
	
	
	private void processAttatches(QnAVO qnaVO) throws IOException {
		List<AttatchVO> attatchList = qnaVO.getAttatchList();
		if (attatchList == null || attatchList.isEmpty()) {
			return;
		}
		log.info("mypost:{}", qnaVO);
		log.info("attatchList:{}", attatchList);
		log.info("saveFolder:{}", saveFolder);
		
		attatchMapper.insertQnAAttatches(qnaVO);
		
		for(AttatchVO attatch : attatchList) {
			MultipartFile file = attatch.getAttatchFile();
			attatch.saveTo(saveFolder);
		}
	}

	@Override
	public int registerAnswer(HttpServletRequest req, QnAVO qnaVO) {
		// TODO Auto-generated method stub
		return 0;
	}




	
	



}
