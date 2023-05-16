package kr.or.ddit.project.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.project.JProjectMapper;
import kr.or.ddit.project.project.vo.ProjectVO;
import kr.or.ddit.project.work.vo.WorkVO;

@Service
public class JProjectServiceImpl implements IJProjectService {

	@Inject
	private JProjectMapper mapper;
	
	//1.내가속한 프로젝트 리스트 전체 출력
	@Override
	public List<ProjectVO> projectAllList(String memId) {
		return mapper.projectAllList(memId);
	}

	// 2.프로젝트 안에 있는 workList 출력
	@Override
	public List<WorkVO> repoWorkList(String pjId) {
		return mapper.repoWorkList(pjId);
	}

	//3. work내에 있는 파일 출력
	@Override
		public WorkVO downloadList(String workNum) {
			return mapper.downloadList(workNum);
	}

	//4.work안에 있는 모든 내 업무 모아보기
	@Override
	public List<WorkVO> workAllList(String memId) {
		return mapper.workAllList(memId);
	}

}
