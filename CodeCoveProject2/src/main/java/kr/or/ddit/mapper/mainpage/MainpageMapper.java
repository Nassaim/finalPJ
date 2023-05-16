package kr.or.ddit.mapper.mainpage;

import java.util.List;

import kr.or.ddit.board.vo.CooBoardVO;
import kr.or.ddit.project.project.vo.ProjectVO;

public interface MainpageMapper {

	public List<CooBoardVO> cobolist();

	public ProjectVO getTotalPj();

}
