package kr.or.ddit.project.folder.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.mapper.project.ProjectFolderMapper;
import kr.or.ddit.project.colleague.vo.ColleagueVO;
import kr.or.ddit.project.folder.vo.ProjectFileVO;
import kr.or.ddit.project.folder.vo.ProjectFolderVO;

@Service
@Transactional
public class ProjectFolderServiceImpl implements ProjectFolderService {

	@Inject
	ProjectFolderMapper projectFolderMapper;

	@Override
	public List<ProjectFolderVO> retrieveFolderList(ColleagueVO colleague) {
		return projectFolderMapper.selectProjectFolderList(colleague);
	}

	@Override
	public List<ProjectFolderVO> retrieveChildFolderList(ProjectFolderVO folder) {
		return projectFolderMapper.selectProjectChildFolderList(folder);
	}

	@Override
	public void createNoParentFolder(ProjectFolderVO folder) {
		projectFolderMapper.insertNoParentFolder(folder);
	}

	@Override
	public void createYesParentFolder(ProjectFolderVO folder) {
		projectFolderMapper.insertYesParentFolder(folder);
	}

	@Override
	public List<ProjectFileVO> retrieveFileList(ProjectFileVO fileVO) {
		return projectFolderMapper.selectFileList(fileVO);
	}

	@Override
	public void createFolderFile(ProjectFileVO fileVO) {
		projectFolderMapper.insertFolderFile(fileVO);
	}

	@Override
	public List<AttatchVO> retrieveUploadFileList(ColleagueVO myColleague) {
		List<ProjectFolderVO> fileList = projectFolderMapper.selectUploadFileList(myColleague);
		List<AttatchVO> single = new ArrayList<>();
		for (int i = 0; i < fileList.size(); i++) {
			for (int j = 0; j < fileList.get(i).getFileList().size(); j++) {
				single.addAll(fileList.get(i).getFileList().get(j).getAttatchVO());
			}
		}
		return single;
	}

	@Override
	public List<ProjectFolderVO> retrieveFolderAllList(ColleagueVO colleague) {
		return projectFolderMapper.selectProjectFolderAllList(colleague);
	}

	@Override
	public void removeFolder(ProjectFolderVO folder) {
		// 해당 폴더의 데이터 중 삭제 여부를 업데이트함
		projectFolderMapper.deleteFolder(folder);
	}

}
