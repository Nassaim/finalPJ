package kr.or.ddit.mapper.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.project.colleague.vo.ColleagueVO;
import kr.or.ddit.project.folder.vo.ProjectFileVO;
import kr.or.ddit.project.folder.vo.ProjectFolderVO;


@Mapper
public interface ProjectFolderMapper {

	/**
	 * 해당 프로젝트에 대한 자신의 폴더 리스트 가져옴
	 * @param colleague
	 * @return
	 */
	public List<ProjectFolderVO> selectProjectFolderList(ColleagueVO colleague);
	
	/**
	 * 해당 프로젝트내 사용자가 만든 자신의 모든 폴더 리스트를 가져옴
	 * @param colleague
	 * @return
	 */
	public List<ProjectFolderVO> selectProjectFolderAllList(ColleagueVO colleague);
	
	/**
	 * 해당 선택한 폴더에 대한 하위 폴더 내역을 가져옴
	 * @param colleague
	 * @return
	 */
	public List<ProjectFolderVO> selectProjectChildFolderList(ProjectFolderVO folder);

	/**
	 * 해당 파일에 대한 업로드 처리
	 * @param fileVO
	 */
	public void insertFolderFile(ProjectFileVO fileVO);
	
	/**
	 * 최상위에 폴더를 생성
	 * @param folder
	 */
	public void insertNoParentFolder(ProjectFolderVO folder);

	/**
	 * 상위폴더가 존재하는 상태에서 하위폴더 생성
	 * @param folder
	 */
	public void insertYesParentFolder(ProjectFolderVO folder);
	
	/**
	 * 해당 폴더의 파일 리스트를 가져온다.
	 * @param folderId
	 * @return
	 */
	public List<ProjectFileVO> selectFileList(ProjectFileVO fileVO);
	
	/**
	 * 해당 폴더에 첨부된 파일들이 전부 지워졌을 경우 해당 기록도 제거함
	 * @param attatchNum
	 */
	public void deleteFile(String attatchNum);

	/**
	 * 해당 회원이 폴더에 업로드한 파일에 대해서 가져옴
	 * @param myColleague
	 * @return
	 */
	public List<ProjectFolderVO> selectUploadFileList(ColleagueVO myColleague);

	/**
	 * 여러개 다운시 사용하는 다운로드 로직
	 * @param attatch
	 * @return
	 */
	public AttatchVO selectMultiDownload(AttatchVO attatch);

	/**
	 * 해당 폴더를 지움
	 * @param folder
	 */
	public void deleteFolder(ProjectFolderVO folder);
}
