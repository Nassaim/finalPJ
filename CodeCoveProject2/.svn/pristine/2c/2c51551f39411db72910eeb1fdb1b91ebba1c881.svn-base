package kr.or.ddit.common.attatch.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.mapper.attach.AttatchMapper;
import kr.or.ddit.mapper.project.ProjectFolderMapper;

@Service
@Transactional
public class AttatchServiceImpl implements AttatchService {

	@Inject
	AttatchMapper attatchMapper;
	
	@Inject
	ProjectFolderMapper projectFolderMapper;

	@Override
	public void createAttatch(AttatchVO attatch) {
		attatchMapper.insertAttatch(attatch);
	}

	@Override
	public AttatchVO download(String attatchNum) {
		return attatchMapper.selectDownload(attatchNum);
	}

	@Override
	public void createFolderAttatch(AttatchVO attatch) {
		if(StringUtils.isBlank(attatch.getAttatchNum()) && StringUtils.isBlank(attatch.getAttatchPlace())) {
			AttatchVO newAttatch = attatchMapper.createFolderNum();
			attatch.setAttatchNum(newAttatch.getAttatchNum());
			attatch.setAttatchPlace(newAttatch.getAttatchPlace());
		}
		
		attatchMapper.insertFolderAttatch(attatch);
		try {
			File file = new File("D:/FinalProject/uploadFile");
			if (!file.exists()) {
				try {
					file.mkdirs();
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
			attatch.saveTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteAttatchFile(AttatchVO attatch) {
		// 지우기 전 해당 파일에 대한 정보를 받아오기
		AttatchVO selectAttatch = attatchMapper.selectAttatchFile(attatch);
		// 업로드된 파일 삭제
		File file = new File("D:/FinalProject/uploadFile");
		selectAttatch.removeTo(file);
		
		attatchMapper.deleteAttatchFile(attatch);
		
		List<AttatchVO> removeAttatch = attatchMapper.selectAttatchFileList(attatch);
		if(removeAttatch.size() == 0) {
			// 해당 attatch 번호에 대한 파일이 다 제거 되었으므로 폴더기록에서도 삭제함
			projectFolderMapper.deleteFile(attatch.getAttatchNum());
		}
	}

	@Override
	public AttatchVO multiDownload(AttatchVO attatch) {
		// 다운로드 시 조회수 1추가
		attatchMapper.updateAttatch(attatch);
		return attatchMapper.multiDownload(attatch);
	}

	@Override
	public void createReplyAttatch(AttatchVO attatch) {
		attatchMapper.insertReplyAttatch(attatch);
		
		File saveFolder = new File("D:/FinalProject/uploadFile");
		try {
			attatch.saveTo(saveFolder);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void createIssueReplyAttatch(AttatchVO attatch) {
		attatchMapper.insertIssueReplyAttatch(attatch);
		
		File saveFolder = new File("D:/FinalProject/uploadFile");
		try {
			attatch.saveTo(saveFolder);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void modifyAttatch(AttatchVO attatch) {
		attatchMapper.modifyIssueReplyAttatch(attatch);
	}

	@Override
	public void createAttachNumReplyAttatch(AttatchVO attatch) {
	    attatchMapper.createAttachNumReplyAttatch(attatch);
	}

	@Override
	public String findAttachNum(String parentWoReplyNum) {
		return attatchMapper.findAttachNum(parentWoReplyNum);
	}

	@Override
	public AttatchVO retrieveAttatch(AttatchVO attatch) {
		return attatchMapper.selectAttatch(attatch);
	}

	@Override
	public void workFileDelete(AttatchVO attatch) {
		attatchMapper.workFileDelete(attatch);
		
	}

	@Override
	public void cooFormFileDelete(String cooFormNum) {
		attatchMapper.cooFormFileDelete(cooFormNum);
		
	}

	@Override
	public void workFileAllDelete(String workNum) {
		attatchMapper.workFileAllDelete(workNum);
	}
	

}
