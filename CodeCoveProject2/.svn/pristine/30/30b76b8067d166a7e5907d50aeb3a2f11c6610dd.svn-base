package kr.or.ddit.project.work.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.mapper.attach.AttatchMapper;
import kr.or.ddit.mapper.project.IIssueMapper;
import kr.or.ddit.mapper.project.IWorkAssignMapper;
import kr.or.ddit.mapper.project.IWorkMapper;
import kr.or.ddit.project.colleague.vo.ColleagueVO;
import kr.or.ddit.project.work.vo.WorkVO;

@Service
public class WorkServiceImpl implements IWorkService {

	@Inject
	private IWorkMapper workMapper;
	
	@Inject
	private IWorkAssignMapper workAssignMapper;
	
	@Inject
	private IIssueMapper issueMapper;
	
	@Inject
	private AttatchMapper attatchMapper;
	
	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
	@Override
	public void register(WorkVO work) {
		try {
			processAttatches(work);
		} catch (IOException e) {
			e.printStackTrace();
		}
		workMapper.register(work);
	}
	
	private void processAttatches(WorkVO work) throws IOException{
		List<AttatchVO> attatchList = work.getAttatchList();
		if (attatchList == null || attatchList.isEmpty()) {
			return;
		}
//		log.info("mypost:{}", work);
//		log.info("attatchList:{}", attatchList);
//		log.info("saveFolder:{}", saveFolder);
		attatchMapper.workInsertAttatch(work);
		// 2진 데이터(파일 자체) 저장 -> d:/saveFiles
		
		for (AttatchVO attatch : attatchList) {
//			MultipartFile file = attatch.getAttatchFile();
			attatch.saveTo(saveFolder);
		}
	}

	@Override
	public List<WorkVO> list(String pjId) {
		return workMapper.list(pjId);
	}

	@Override
	public void delete(String workNum) {
		workMapper.delete(workNum);
	}

	@Override
	public void modify(WorkVO work) {
		workMapper.modify(work);
		
	}

	@Override
	public WorkVO workFileDetail(String workNum) {
		return workMapper.workFileDetail(workNum);
	}

	@Override
	public void workAllDelete(String pjId) {
		workMapper.workAllDelete(pjId);
	}

	@Override
	public void calendarWorkModify(WorkVO work) {
		workMapper.calendarWorkModify(work);
	}

	@Override
	public void boardModify(WorkVO work) {
		workMapper.boardModify(work);
		
	}

	@Override
	public void workExit(ColleagueVO colleague) {
		List<ColleagueVO> selectExitList = workMapper.selectExitWork(colleague);
		for(int i=0; i<selectExitList.size(); i++) {
			String workNum = selectExitList.get(i).getWorkNum();
			workAssignMapper.delete(workNum);
			issueMapper.allDelete(workNum);
			attatchMapper.workFileAllDelete(workNum);
			workMapper.delete(workNum);
		}
		
	}

	@Override
	public List<WorkVO> myCalList(String loginId) {
		return workMapper.myCalList(loginId);
	}


}
