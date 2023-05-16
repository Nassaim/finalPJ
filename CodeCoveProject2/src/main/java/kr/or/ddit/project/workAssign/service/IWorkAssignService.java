package kr.or.ddit.project.workAssign.service;

import java.util.List;

import kr.or.ddit.project.workAssign.vo.workAssignVO;

public interface IWorkAssignService {
	public void register(workAssignVO workAssign);
	public List<workAssignVO> list(String workNum);
	public void delete(String workNum);
	public void workAssignExit(String colNum);
}
