package kr.or.ddit.project.colleague.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.project.IColleagueMapper;
import kr.or.ddit.project.colleague.vo.ColleagueVO;

@Service
public class ColleagueServiceImpl implements IColleagueService {

	@Inject
	private IColleagueMapper colleagueMapper;
	
	@Override
	public List<ColleagueVO> list(String pjId) {
		return colleagueMapper.list(pjId);
	}

	@Override
	public void register(ColleagueVO colleague) {
		colleagueMapper.register(colleague);
		
	}

	@Override
	public List<ColleagueVO> detailList(String workNum) {
		return colleagueMapper.detailList(workNum);
	}

	@Override
	public void collAllDelete(String pjId) {
		colleagueMapper.collAllDelete(pjId);
	}

	@Override
	public void roleModify(ColleagueVO colleague) {
		int cnt = colleagueMapper.roleModify(colleague);
		if(cnt>0) {
			colleagueMapper.rolePlModify(colleague);
		}
		
	}

	@Override
	public void selectRoleModify(ColleagueVO colleague) {
		colleagueMapper.selectRoleModify(colleague);
		
	}

	@Override
	public List<ColleagueVO> cooFormList(String pjId) {
		return colleagueMapper.cooFormList(pjId);
	}

	@Override
	public void collExit(String colNum) {
		colleagueMapper.collExit(colNum);
	}

}
