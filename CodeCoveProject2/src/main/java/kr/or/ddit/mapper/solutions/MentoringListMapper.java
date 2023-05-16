package kr.or.ddit.mapper.solutions;

import java.util.List;

import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.expert.vo.ExpertProdVO;

public interface MentoringListMapper {

	int selectMentoringCategoryCount(PaginationInfoVO<ExpertProdVO> pagingVO);

	List<ExpertProdVO> mentoringCategory(PaginationInfoVO<ExpertProdVO> pagingVO);

}
