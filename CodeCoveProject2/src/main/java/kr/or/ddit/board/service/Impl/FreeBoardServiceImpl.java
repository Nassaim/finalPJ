package kr.or.ddit.board.service.Impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.board.service.FreeBoardService;
import kr.or.ddit.board.vo.FreeBoardVO;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.common.exception.NotAuthorityException;
import kr.or.ddit.common.exception.NotFoundException;
import kr.or.ddit.mapper.attach.AttatchMapper;
import kr.or.ddit.mapper.board.FreeBoardMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Inject
	private FreeBoardMapper mapper;

	@Inject
	AttatchMapper attatchMapper;

	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;

	@PostConstruct
	public void init() throws IOException {
		log.info("주입된 저장 경로 : {}", saveFolder.getCanonicalPath());
	}


	@Transactional
	@Override
	public int insertFreeBoard(FreeBoardVO freeBoardVO) {
		try {
			processAttatches(freeBoardVO); // 첨부파일 처리.
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		int rowcnt = mapper.insertFreeBoard(freeBoardVO);

		return rowcnt;
	}
	private void processAttatches(FreeBoardVO freeBoardVO) throws IOException {
		List<AttatchVO> attatchList = freeBoardVO.getAttatchList();
		if (attatchList == null || attatchList.isEmpty()) {
			return;
		}
		log.info("freeBoardVO:{}", freeBoardVO);
		log.info("attatchList:{}", attatchList);
		log.info("saveFolder:{}", saveFolder);
		attatchMapper.insertFreeBoardAttatches(freeBoardVO);
		// 2진 데이터(파일 자체) 저장 -> d:/saveFiles

		for (AttatchVO attatch : attatchList) {
			MultipartFile file = attatch.getAttatchFile();
			attatch.saveTo(saveFolder);
		}
	}

//	@Override
//	public FreeBoardVO read(String freeNum) {
//		mapper.incrementHit(freeNum);
//		FreeBoardVO freeBoardVO=mapper.read(freeNum);
//		return freeBoardVO;
//	}
	
	//자유게시판(FreeBoardVO)+ 공지사항 첨부파일(NOTICEFILE) 목록 
	@Override
	public List<FreeBoardVO> attatchNums() {
		return this.mapper.attatchNums();
	}

	@Override
	public FreeBoardVO retrievePost(String freeNum) {
		mapper.incrementHit(freeNum);
		Map<String, String> map = new HashMap<String, String>();
		map.put("freeNum", freeNum);
		FreeBoardVO freeBoardVO=mapper.selectFreeBoard(map);
		if (freeBoardVO == null) {
			throw new NotFoundException();
		}
		return freeBoardVO;
	}
	@Override
	public void deleteFreeBoard(String freeNum) {

		// Delete SQL에서 필요한 3가지 - order, placeNumber(freeNum), attachNum 가 필요함
		
		int attachOrder = 0;
		String attachNum = "";
		
		// attach_num만 뽑음
		List<AttatchVO> attachList = attatchMapper.selectAttatchNum(freeNum); 
		for (int i = 0; i < attachList.size(); i++) {
			attachOrder = i;
			attachNum = attachList.get(i).getAttatchNum();
			
			AttatchVO attatchVO = new AttatchVO();
			attatchVO.setAttatchNum(attachNum);
			
			attatchMapper.deleteAttatchFile(attatchVO);
		}
		
		mapper.deleteFreeBoard(freeNum);
		
	}
	
	//게시글 수정
	@Override
	public int modifyFreeBoard(Map<String, Object> map) {
		FreeBoardVO freeBoardVO =(FreeBoardVO) map.get("freeBoardVO");
		log.info("freeBoardVO:{}",freeBoardVO);
		int rowcnt=mapper.updateFreeBoard(freeBoardVO);
		
		try {
			processAttatches(freeBoardVO);
		}catch(IOException e) {
			throw new RuntimeException(e);
		}
		String[] attatchNum = (String[]) map.get("attatchNum");
		log.info("attatchNum:{}", attatchNum);
		int[] attatchOrder = (int[]) map.get("attatchOrder");
		if (attatchNum != null) {
			AttatchVO attatchVO = new AttatchVO();
			attatchVO.setAttatchPlace(freeBoardVO.getFreeNum());
			for (String num : attatchNum) {
				attatchVO.setAttatchNum(num);
				for (int order : attatchOrder) {
					attatchVO.setAttatchOrder(order);
					attatchMapper.deleteAttatchFile(attatchVO);
				}
			}
		}
		return rowcnt;
	}


	@Override
	public List<FreeBoardVO> selectFreeBoList(PaginationInfoVO<FreeBoardVO> pagingVO) {
		return mapper.selectFreeBoList(pagingVO);
	}


	@Override
	public int countFreeBoList(PaginationInfoVO<FreeBoardVO> pagingVO) {
		return mapper.countFreeBoList(pagingVO);
	}

}
