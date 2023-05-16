package kr.or.ddit.expert.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.expert.vo.ExpertProdVO;
import kr.or.ddit.mapper.solutions.templateListMapper;

@Service
public class templateListServiceImpl implements ITemplateListService {
	@Inject
	private templateListMapper mapper;
	

//	@Override
//	public List<ExpertProdVO> templateCategory(ExpertProdVO expProdVO) {
//		return mapper.templateCategory(expProdVO);
//	}
	
	@Override
	public int selectTemplateCategoryCount(PaginationInfoVO<ExpertProdVO> pagingVO) {
		return mapper.selectTemplateCategoryCount(pagingVO);
	}

	@Override
	public List<ExpertProdVO> templateCategory(PaginationInfoVO<ExpertProdVO> pagingVO) {
		return mapper.templateCategory(pagingVO);
	}


}
