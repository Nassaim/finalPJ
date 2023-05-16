package kr.or.ddit.mapper.project;

import java.util.List;

import kr.or.ddit.project.workAssign.vo.workAssignVO;

public interface IWorkAssignMapper {
	public void register(workAssignVO workAssign);
	public List<workAssignVO> list(String workNum);
	public void delete(String workNum);
	public void workAssignExit(String colNum);
}
