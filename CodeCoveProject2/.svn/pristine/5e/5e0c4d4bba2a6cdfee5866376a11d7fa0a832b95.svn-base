package kr.or.ddit.expert.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.apache.velocity.tools.config.SkipSetters;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.common.ReportVO;
import kr.or.ddit.expert.vo.ExpHeartVO;
import kr.or.ddit.expert.vo.ExpertProdVO;
import kr.or.ddit.expert.vo.MentoProfileVO;
import kr.or.ddit.expert.vo.MyExpertVO;
import kr.or.ddit.expert.vo.TemplateReviewVO;
import kr.or.ddit.mapper.attach.AttatchMapper;
import kr.or.ddit.mapper.solutions.EprodMapper;
import kr.or.ddit.mapper.solutions.ReviewMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EprodServiceImpl implements IEprodService {

	private ReviewMapper reviewMapper;
	
	@Inject
	private EprodMapper mapper;
	
	@Inject
	private AttatchMapper attatchMapper;
	
	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;
	
////////////templateInsert 시작	
	
	@Override
	public void templateInsert(ExpertProdVO expertProdVO) throws Exception {
		try {
		processAttatches(expertProdVO);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		
		
		 mapper.templateInsert(expertProdVO);
	}



	private void processAttatches(ExpertProdVO expertProdVO) throws IOException {
		List<AttatchVO> attatchList = expertProdVO.getAttatchList();
		if (attatchList == null || attatchList.isEmpty()) {
			return;
		}
		log.info("mypost:{}", expertProdVO);
		log.info("attatchList:{}", attatchList);
		log.info("saveFolder:{}", saveFolder);
		attatchMapper.templateInsertAttatch(expertProdVO);
		// 2진 데이터(파일 자체) 저장 -> d:/saveFiles
		
		
		for (AttatchVO attatch : attatchList) {
			MultipartFile file = attatch.getAttatchFile();
			attatch.saveTo(saveFolder);
		}
	}

	
////////////templateInsert 끝	


	@Override
	public ExpertProdVO templateDetail(String eprodNum) {
		
		
//		상품번호를 통해 결제 여부를 알아내는 쿼리 -->
		int downloadYn = mapper.download(eprodNum);
		log.info("downloadYn : " + downloadYn);

//		상품번호를 통해 찜하기가 몇 개인지 알아내는 쿼리
		int countHeart = mapper.countHeart(eprodNum);
		
//		상품번호를 통해 리뷰가 몇 개인지 알아내는 쿼리
		int countReview = mapper.countReview(eprodNum);
		
//		상품번호를 통해 별점 평균을 알아내는 쿼리
		Float starAvg = mapper.starAvg(eprodNum);
		

		
		ExpertProdVO expertProdVO = mapper.templateDetail(eprodNum);
		//downloadYn : 0보다 크면 결제가 됨
		expertProdVO.setDownloadYn(downloadYn);
		expertProdVO.setCountHeart(countHeart);
		expertProdVO.setStarAvg(starAvg);
		expertProdVO.setCountReview(countReview);


		
		
		return expertProdVO;
	}



	@Override
	public void buyInsert(MyExpertVO myExpertVO) {
		mapper.buyInsert(myExpertVO);
		
	}



	@Override
	public MyExpertVO paySuccessInsert(MyExpertVO myExpertVO) {
		int cnt = mapper.paySuccessInsert(myExpertVO);
		MyExpertVO receipt = new MyExpertVO();
		if(cnt>0) {
			mapper.buyUpdate(myExpertVO.getMyEprod());
			receipt= mapper.paySelect(myExpertVO.getEpayNum());
		}
		log.debug("여기에 get epaynum? : "+myExpertVO.getEpayNum());
		return receipt;
	}



	@Override
	public MentoProfileVO mentoProfile(String expertId) {
		MentoProfileVO mentoProdVO = mapper.mentoProfile(expertId);
		
		return mentoProdVO;
	}


















}
