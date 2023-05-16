package kr.or.ddit.board.service.Impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.board.service.CooBoardService;
import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.board.vo.CooFormVO;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.common.exception.NotFoundException;
import kr.or.ddit.mainpage.vo.QnAVO;
import kr.or.ddit.mapper.attach.AttatchMapper;
import kr.or.ddit.mapper.board.CooBoardMapper;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.project.colleague.vo.ColleagueVO;
import kr.or.ddit.project.project.vo.ProjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CooBoardServiceImpl implements CooBoardService {

	@Inject
	private CooBoardMapper mapper;

	@Inject
	AttatchMapper attatchMapper;

	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;

	@Override
	public int insertCooBoard(CooBoardVO cooBoardVO) {
		try {
			processAttatches(cooBoardVO); // 첨부파일 처리.
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		int rowcnt = mapper.insertCooBoard(cooBoardVO);

		return rowcnt;
	}

	// 협업 게시글 첨부파일
	private void processAttatches(CooBoardVO cooBoardVO) throws IOException {
		List<AttatchVO> attatchList = cooBoardVO.getAttatchList();
		if (attatchList == null || attatchList.isEmpty()) {
			return;
		}
		log.info("cooBoardVO:{}", cooBoardVO);
		log.info("attatchList:{}", attatchList);
		log.info("cooBoardVO:{}", cooBoardVO);
		attatchMapper.insertCooBoardAttatches(cooBoardVO);
		// 2진 데이터(파일 자체) 저장 -> d:/saveFiles

		for (AttatchVO attatch : attatchList) {
			MultipartFile file = attatch.getAttatchFile();
			attatch.saveTo(saveFolder);
		}
	}

	@Override
	public CooBoardVO retrievePost(String cooNm) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("cooNm", cooNm);
		CooBoardVO cooBoardVO = mapper.selectCooBoard(map);
		if (cooBoardVO == null) {
			throw new NotFoundException();
		}
		mapper.incrementHit(cooNm);
		return cooBoardVO;
	}

	@Override
	public List<ProjectVO> selectProjList(String memId) {
		return mapper.selectProjList(memId);
	}

	@Override
	public ProjectVO selectPjId(String pjId) {
		return mapper.selectPjId(pjId);
	}

	@Override
	public List<CooBoardVO> selectPjBoList(PaginationInfoVO<CooBoardVO> pagingVO) {
		return mapper.selectPjBoList(pagingVO);
	}

//	@Override
//	public CooBoardVO read(String cooNm) {
//		CooBoardVO cooBoardVO=mapper.read(cooNm);
//		mapper.incrementHit(cooNm);
//		return cooBoardVO;
//	}
	@Override
	public int insertApplyForm(CooFormVO cooFormVO) {
		try {
			processAttatches(cooFormVO); // 첨부파일 처리.
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		int rowcnt = mapper.insertApplyForm(cooFormVO);

		return rowcnt;

	}

	// 협업신청서 첨부파일
	private void processAttatches(CooFormVO cooFormVO) throws IOException {
		List<AttatchVO> attatchList = cooFormVO.getAttatchList();
		if (attatchList == null || attatchList.isEmpty()) {
			return;
		}
		log.info("cooFormVO:{}", cooFormVO);
		log.info("attatchList:{}", attatchList);
		log.info("cooFormVO:{}", cooFormVO);
		attatchMapper.insertCooApplyAttatches(cooFormVO);
		// 2진 데이터(파일 자체) 저장 -> d:/saveFiles

		for (AttatchVO attatch : attatchList) {
			MultipartFile file = attatch.getAttatchFile();
			attatch.saveTo(saveFolder);
		}
	}

	@Override
	public int countCoBoList(PaginationInfoVO<CooBoardVO> pagingVO) {
		return mapper.countCoBoList(pagingVO);
	}

	@Override
	public int memberCount(String pjId) {
		return mapper.participantNum(pjId);
	}

	@Override
	public CooFormVO cooFormDetail(String cooFormNum) {
		return mapper.cooFormDetail(cooFormNum);
	}

	@Override
	public void cooFormDelete(String cooFormNum) {
		mapper.cooFormDelete(cooFormNum);
	}

	@Override
	public ServiceResult updateCooBoard(CooBoardVO cooBoardVO) {
		ServiceResult result = null;
		int cnt = mapper.updateCooBoard(cooBoardVO);
		AttatchVO attatch = new AttatchVO();
		if (cnt > 0) {
			List<AttatchVO> attatchList = cooBoardVO.getAttatchList();
//			try {
//				processAttatches(cooBoardVO); // 넘겨받은 파일 데이터 추가
//				Integer[] delCoBoNo = cooBoardVO.getDelCoBoNo();
//				if (delCoBoNo != null) {
//					for (int i = 0; i < delCoBoNo.length; i++) {
//						AttatchVO attatchVO = attatchMapper.selectAttatchFile(attatch);
//						attatchMapper.deleteAttatchFile(attatch);
//						File file = new File(attatchVO.getFilePath());
//						file.delete();
//					}
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

}
