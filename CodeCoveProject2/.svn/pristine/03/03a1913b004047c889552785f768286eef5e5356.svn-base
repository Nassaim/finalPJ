package kr.or.ddit.project.workAssign.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.project.IWorkAssignMapper;
import kr.or.ddit.project.workAssign.vo.workAssignVO;

@Service
public class WorkAssignServiceImpl implements IWorkAssignService{
	
	@Inject
	private IWorkAssignMapper workAssignMapper;

	@Override
	public void register(workAssignVO workAssign) {
		workAssignMapper.register(workAssign);
	}

	@Override
	public List<workAssignVO> list(String workNum) {
		return workAssignMapper.list(workNum);
	}

	@Override
	public void delete(String workNum) {
		workAssignMapper.delete(workNum);
	}

	@Override
	public void workAssignExit(String colNum) {
		workAssignMapper.workAssignExit(colNum);
	}

}
