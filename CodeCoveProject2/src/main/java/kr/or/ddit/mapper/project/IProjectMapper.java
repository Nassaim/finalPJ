package kr.or.ddit.mapper.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.project.project.vo.ProjectVO;

@Mapper
public interface IProjectMapper {
	public void register(ProjectVO project);
	public List<ProjectVO> list(String loginId);
	public ProjectVO detail(String pjId);
	public void modify(ProjectVO project);
	public void delete(String pjId);
	public List<ProjectVO> comList(String codeGrp);
	public void adminModify(ProjectVO project);
}
