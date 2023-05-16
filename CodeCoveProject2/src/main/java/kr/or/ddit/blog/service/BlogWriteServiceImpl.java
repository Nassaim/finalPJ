package kr.or.ddit.blog.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.blog.vo.BlogHeartVO;
import kr.or.ddit.blog.vo.MyBlogPostVO;
import kr.or.ddit.blog.vo.PostMarkVO;
import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mapper.attach.AttatchMapper;
import kr.or.ddit.mapper.blog.BlogWriteMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BlogWriteServiceImpl implements BlogWriteService {

	@Inject
	BlogWriteMapper writeMapper;

	@Inject
	AttatchMapper attatchMapper;

	@Value("#{appInfo['attatchPath']}")
	private File saveFolder;

	@PostConstruct
	public void init() throws IOException {
		log.info("주입된 저장 경로 : {}", saveFolder.getCanonicalPath());
	}

	@Transactional
	@Override
	public int createMypost(MyBlogPostVO mypost) {
		try {
			processAttatches(mypost); // 첨부파일 처리.
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		int rowcnt = writeMapper.insertMyPost(mypost);

		return rowcnt;
	}

	@Transactional
	@Override
	public int modifyPost(Map<String, Object> map) {
		MyBlogPostVO mypost = (MyBlogPostVO) map.get("mypost");
		log.info("mypost:{}", mypost);
		int rowcnt = writeMapper.updatePost(mypost);

		try {
			processAttatches(mypost); // 첨부파일 처리.
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

		String[] attatchNum = (String[]) map.get("attatchNum");
		log.info("attatchNum:{}", attatchNum);
		int[] attatchOrder = (int[]) map.get("attatchOrder");
		if (attatchNum != null) {
			AttatchVO attatchVO = new AttatchVO();
			attatchVO.setAttatchPlace(mypost.getPostNum());
			for (String num : attatchNum) {
				attatchVO.setAttatchNum(num);
				for (int order : attatchOrder) {
					attatchVO.setAttatchOrder(order);
					attatchMapper.deleteAttatchFile(attatchVO);
				}
			}
		}

		return rowcnt;
	}

	private void processAttatches(MyBlogPostVO mypost) throws IOException {
		List<AttatchVO> attatchList = mypost.getAttatchList();
		if (attatchList == null || attatchList.isEmpty()) {
			return;
		}
		log.info("mypost:{}", mypost);
		log.info("attatchList:{}", attatchList);
		log.info("saveFolder:{}", saveFolder);
		attatchMapper.insertBlogAttatches(mypost);
		// 2진 데이터(파일 자체) 저장 -> d:/saveFiles

		for (AttatchVO attatch : attatchList) {
			MultipartFile file = attatch.getAttatchFile();
			attatch.saveTo(saveFolder);
		}
	}

	@Override
	public int createHeart(BlogHeartVO heart) {
		int rowcnt = writeMapper.insertHeart(heart);
		return rowcnt;
	}

	@Override
	public int deleteHeart(BlogHeartVO heart) {
		int rowcnt = writeMapper.deleteHeart(heart);
		return rowcnt;
	}

	@Override
	public boolean heartYn(BlogHeartVO heart) {
		boolean heartChk = false;
		BlogHeartVO mypostmark = writeMapper.selectHeartYn(heart);
		if (mypostmark != null) {
			heartChk = true;
		} else {
			heartChk = false;
		}
		return heartChk;
	}

	@Override
	public int countHeart(String postNum) {
		int heartNo = writeMapper.selectTotalHeart(postNum);
		return heartNo;
	}

	@Override
	public int modifyHeartNo(String postNum) {
		int heart = writeMapper.updateHeartNo(postNum);
		return heart;
	}
	
	@Override
	public List<PostMarkVO> retrieveMyMarkList(PaginationInfoVO<PostMarkVO> pagingVO) {
		pagingVO.setTotalRecord(writeMapper.selectmyMarkTotal(pagingVO));
		List<PostMarkVO> mymarkList = writeMapper.selectmyMarkList(pagingVO);
		pagingVO.setDataList(mymarkList);
		return mymarkList;
	}

}
