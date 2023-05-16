package kr.or.ddit.member.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.board.vo.FreeBoardVO;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.expert.service.EprodServiceImpl;
import kr.or.ddit.expert.vo.ExpertProdVO;
import kr.or.ddit.mainpage.vo.QnAVO;
import kr.or.ddit.mapper.attach.AttatchMapper;
import kr.or.ddit.mapper.member.MypageMapper;
import kr.or.ddit.member.vo.ExpertVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.MyReplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MypageServiceImpl implements IMypageService {
	
	@Inject
	private MypageMapper mypageMapper;
	
	@Inject
	private AttatchMapper attatchMapper;
	
	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
	@Override
	public ServiceResult progressUpdate(String epayNum) {
		
		ServiceResult result = null;
		int updateChk = mypageMapper.progressUpdate(epayNum);
		
		if (updateChk > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
		
	}

	@Override
	public List<ExpertVO> totalList(MemberVO member) {
		return mypageMapper.mentorList(member);
	}

	
	@Override
	public int mentorInsert(ExpertVO expertVO) {
		
		try {
			processAttatches(expertVO);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int result = 0;
		
		// 일반 데이터 insert
		int insertRst = mypageMapper.mentorInsert(expertVO);
		
		String memId = expertVO.getFormId();
		// 상태 업데이트
		int updateRst = mypageMapper.updateMentorStatus(memId);
		
		if (insertRst > 0 && updateRst > 0 ) {
			result = 1;
		}
		
		return result;
	}
	
	
	private void processAttatches(ExpertVO expertVO) throws IOException {
		List<AttatchVO> attatchList = expertVO.getAttatchList();
		if (attatchList == null || attatchList.isEmpty()) {
			return;
		}
		log.info("mypost:{}", expertVO);
		log.info("attatchList:{}", attatchList);
		log.info("saveFolder:{}", saveFolder);
		
		// 파일 insert
		attatchMapper.mentorInsertAttatch(expertVO);
		// 2진 데이터(파일 자체) 저장 -> d:/saveFiles

		for (AttatchVO attatch : attatchList) {
			MultipartFile file = attatch.getAttatchFile();
			attatch.saveTo(saveFolder);
		}
	}

	@Override
	public List<FreeBoardVO> selectMyFree(String memId) {
		
		return mypageMapper.myFreeList(memId);
	}

	@Override
	public List<CooBoardVO> selectMyCoo(String memId) {
		return mypageMapper.myCooList(memId);
	}

	@Override
	public List<MyReplyVO> selectMyReply(String memId) {
		return mypageMapper.myReplyList(memId);
	}

	@Override
	public List<QnAVO> selectMyQna(String memId) {
		return mypageMapper.myQnaList(memId);
	}

	@Override
	public ExpertVO getMentorDetail(String memId) {
		return mypageMapper.getMentorDetail(memId);
	}

	@Override
	public List<AttatchVO> getAttachFiles(String formNum) {
		return mypageMapper.getAttachFiles(formNum);
	}

	@Override
	public ServiceResult mentorModify(ExpertVO expertVO) {
		ServiceResult result = null;
		
		// 파일이 있는 경우에만 삭제하고 아니면 일반데이터 수정만하기
		if (!expertVO.getDelList().equals("")) {
			// delList -> 배열 저장
			String str = expertVO.getDelList(); // '1,2,' 으로 적혀있는 것
			if(str.endsWith(",") ) { // 맨 끝 , 잘라내기
				str = str.substring(0, str.length() - 1); 
			}
			
			String[] strArr = str.split(","); // 문자열 분리
			
			int[] delList = new int[strArr.length]; // int 타입 저장 - attatchOrder가 int임
			for(int i = 0; i < strArr.length; i++) {
				delList[i] = Integer.parseInt(strArr[i]);
			}
			
			log.debug("삭제할 파일 번호 servieimpl 확인 >> " + Arrays.toString(delList));
			
			// 파일 삭제
			for (int i = 0; i < delList.length; i++) {
				AttatchVO delAtchVo = new AttatchVO();
				delAtchVo.setAttatchOrder(delList[i]);
				delAtchVo.setAttatchPlace(expertVO.getExpFormNum());
				
				log.debug("삭제할 attatchVO 확인 {} : " + delAtchVo);
				mypageMapper.deleteFiles(delAtchVo); // 파일 삭제 - index + 파일 게시판 번호
			}
		} // 삭제파일 있는 경우에만

		
		int modifyChk = mypageMapper.mentorModify(expertVO); // 일반데이터 업데이트		
		
		if (modifyChk > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
		
	}// mentorModify end
	
}
