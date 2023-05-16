package kr.or.ddit.expert.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.expert.vo.ExpertProdVO;
import kr.or.ddit.mapper.solutions.MentoringListMapper;

@Service
public class MentoringServiceImpl implements IMentoringService {

	@Inject
	private MentoringListMapper mapper;
	
	
	@Override
	public int selectMentoringCategoryCount(PaginationInfoVO<ExpertProdVO> pagingVO) {
		return mapper.selectMentoringCategoryCount(pagingVO);
	}

	@Override
	public List<ExpertProdVO> mentoringCategory(PaginationInfoVO<ExpertProdVO> pagingVO) {
		return mapper.mentoringCategory(pagingVO);
	}

}
