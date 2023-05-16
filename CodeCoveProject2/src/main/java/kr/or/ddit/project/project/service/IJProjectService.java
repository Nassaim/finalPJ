package kr.or.ddit.project.project.service;

import java.util.List;

import kr.or.ddit.project.project.vo.ProjectVO;
import kr.or.ddit.project.work.vo.WorkVO;

public interface IJProjectService {

	// 1.내가속한 프로젝트 리스트 전체 출력
	List<ProjectVO> projectAllList(String memId);

	// 2.프로젝트 안에 있는 workList 출력
	List<WorkVO> repoWorkList(String pjId);

	//3. work내에 있는 파일 출력
	WorkVO downloadList(String workNum);

	//4.work안에 있는 모든 내 업무 모아보기
	List<WorkVO> workAllList(String memId);

}
