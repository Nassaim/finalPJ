package kr.or.ddit.mainpage.service;

import java.util.List;

import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.project.project.vo.ProjectVO;

public interface MainpageService {

	public List<CooBoardVO> cobolist();

	public ProjectVO getTotalPj();

}
