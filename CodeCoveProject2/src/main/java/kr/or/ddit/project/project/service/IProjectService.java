package kr.or.ddit.project.project.service;

import java.util.List;

import kr.or.ddit.project.project.vo.ProjectVO;

public interface IProjectService {
	public void register(ProjectVO project);
	public List<ProjectVO> list(String loginId);
	public ProjectVO detail(String pjId);
	public void modify(ProjectVO project);
	public void delete(String pjId);
	public List<ProjectVO> comList(String codeGrp);
	public void adminModify(ProjectVO project);
}
