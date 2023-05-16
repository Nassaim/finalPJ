package kr.or.ddit.mapper.solutions;

import java.util.List;

import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.expert.vo.ExpertProdVO;

public interface templateListMapper {


//	public List<ExpertProdVO> templateCategory(ExpertProdVO expProdVO);

	public List<ExpertProdVO> templateCategory(PaginationInfoVO<ExpertProdVO> pagingVO);

	public int selectTemplateCategoryCount(PaginationInfoVO<ExpertProdVO> pagingVO);

}
