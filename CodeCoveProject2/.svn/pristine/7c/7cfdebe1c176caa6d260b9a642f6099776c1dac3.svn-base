package kr.or.ddit.project.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.project.IProjectMapper;
import kr.or.ddit.project.project.vo.ProjectVO;

@Service
public class ProjectServiceImpl implements IProjectService {

	@Inject
	private IProjectMapper projectMapper;
	
	@Override
	public void register(ProjectVO project) {
		projectMapper.register(project);
	}

	@Override
	public List<ProjectVO> list(String loginId) {
		return projectMapper.list(loginId);
	}

	@Override
	public ProjectVO detail(String pjId) {
		return projectMapper.detail(pjId);
	}

	@Override
	public void modify(ProjectVO project) {
		projectMapper.modify(project);
	}

	@Override
	public void delete(String pjId) {
		projectMapper.delete(pjId);
	}

	@Override
	public List<ProjectVO> comList(String codeGrp) {
		return projectMapper.comList(codeGrp);
	}

	@Override
	public void adminModify(ProjectVO project) {
		projectMapper.adminModify(project);
	}


}
