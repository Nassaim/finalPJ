package kr.or.ddit.expert.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.ReportVO;
import kr.or.ddit.expert.vo.ExpHeartVO;
import kr.or.ddit.expert.vo.ExpertProdVO;
import kr.or.ddit.expert.vo.TemplateReviewVO;
import kr.or.ddit.mapper.solutions.ReviewMapper;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class TemplateReviewServiceImpl implements ITemplateReviewService {

	@Inject
	ReviewMapper mapper;
	
	//리뷰 인서트
	@Override
	public void reviewInsert(TemplateReviewVO templateReviewVO) {
		mapper.templateReviewInsert(templateReviewVO);
	}

	//템플릿 리뷰 리스트
	@Override
	public List<TemplateReviewVO> templateReviewList(String eprodNum) {
		return mapper.templateReviewList(eprodNum);
	}

	//하트 인서트 ajax
	@Override
	public void templateHeartInsert(ExpHeartVO expHeartVO) {
		mapper.templateHeartInsert(expHeartVO);
	}

	//하트 딜리트 ajax
	@Override
	public void templateHeartDelete(ExpHeartVO expHeartVO) {
		mapper.templateHeartDelete(expHeartVO);
		
	}


	//총 하트갯수
	@Override
	public int isHeart(ExpHeartVO expHeartVO) {
		int heartCheck = mapper.isHeart(expHeartVO);
		log.debug("heart가 몇개야?"+heartCheck);
		
		return heartCheck;
	}

	//리뷰 썼는지 확인ajax
	@Override
	public int isReview(TemplateReviewVO templateReviewVO) {
		int reviewCheck = mapper.isReview(templateReviewVO);
		log.debug("리뷰 몇 개 썼어?" + reviewCheck);
		return reviewCheck;
	}


	//신고 인서트
	@Override
	public void reportInsert(ReportVO reportVO) {
		mapper.reportInsert(reportVO);
		
	}


	//신고갯수있는지 확인 ajax
	@Override
	public int isReport(ReportVO reportVO) {
		int reportCheck = mapper.isReport(reportVO);
		return reportCheck;
	}


	//별점평균 아작스로 화면출력
	@Override
	public float starAvgAjax(ExpertProdVO expertProdVO) {
		float starAvg = mapper.starAvgAjax(expertProdVO);
		return starAvg;
	}

	//댓글 작성시 카운트 갯수를 올려주는 아작스 화면 출력
	@Override
	public int countReview(TemplateReviewVO templateReviewVO) {
		int countReview = mapper.countReview(templateReviewVO);
		return countReview;
	}








}
