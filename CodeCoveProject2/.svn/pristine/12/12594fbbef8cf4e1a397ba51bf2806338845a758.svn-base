package kr.or.ddit.project.folder.service;

import java.util.List;

import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.project.colleague.vo.ColleagueVO;
import kr.or.ddit.project.folder.vo.ProjectFileVO;
import kr.or.ddit.project.folder.vo.ProjectFolderVO;


public interface ProjectFolderService {

	public List<ProjectFolderVO> retrieveFolderList(ColleagueVO colleague);
	
	public List<ProjectFolderVO> retrieveFolderAllList(ColleagueVO colleague);
	
	public List<ProjectFolderVO> retrieveChildFolderList(ProjectFolderVO folder);
	
	/**
	 * 해당 폴더에 파일업로드시 사용
	 * @param fileVO
	 */
	public void createFolderFile(ProjectFileVO fileVO);
	
	/**
	 * 최상위 폴더 만드는 것
	 * @param folder
	 */
	public void createNoParentFolder(ProjectFolderVO folder);
	
	/**
	 * 상위 폴더 밑에 해당 폴더 만들기
	 * @param folder
	 */
	public void createYesParentFolder(ProjectFolderVO folder);
	
	/**
	 * 선택한 폴더의 파일리스트를 가져옴
	 * @param folderId
	 * @return
	 */
	public List<ProjectFileVO> retrieveFileList(ProjectFileVO fileVO);

	/**
	 * 해당 회원이 업로드한 파일 리스트를 다가져옴
	 * @param myColleague
	 * @return
	 */
	public List<AttatchVO> retrieveUploadFileList(ColleagueVO myColleague);

	/**
	 * 해당 폴더 번호에 해당하는  모든 것을 지움(첨부파일 -> 폴더 첨부파일 -> 업무 폴더)
	 * @param folder
	 */
	public void removeFolder(ProjectFolderVO folder);
}
