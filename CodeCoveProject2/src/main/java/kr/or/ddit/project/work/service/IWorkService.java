package kr.or.ddit.project.work.service;

import java.util.List;

import kr.or.ddit.project.colleague.vo.ColleagueVO;
import kr.or.ddit.project.work.vo.WorkVO;

public interface IWorkService {
	public void register(WorkVO work);
	public List<WorkVO> list(String pjId);
	public void delete(String workNum);
	public void modify(WorkVO work);
	public WorkVO workFileDetail(String workNum);
	public void workAllDelete(String pjId);
	public void calendarWorkModify(WorkVO work);
	public void boardModify(WorkVO work);
	public void workExit(ColleagueVO colleague);
	public List<WorkVO> myCalList(String loginId);
}
