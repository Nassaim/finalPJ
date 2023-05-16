package kr.or.ddit.mainpage.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.mainpage.service.MainpageService;
import kr.or.ddit.mapper.mainpage.MainpageMapper;
import kr.or.ddit.project.project.vo.ProjectVO;

@Service
public class MainpageServiceImpl implements MainpageService {
	
	@Inject
	private MainpageMapper mapper;
	
	@Override
	public List<CooBoardVO> cobolist() {
		return mapper.cobolist();
	}

	@Override
	public ProjectVO getTotalPj() {
		return mapper.getTotalPj();
	}

}
