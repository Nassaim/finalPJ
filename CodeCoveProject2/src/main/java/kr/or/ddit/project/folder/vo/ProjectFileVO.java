package kr.or.ddit.project.folder.vo;

import java.util.List;

import kr.or.ddit.common.AttatchVO;
import lombok.Data;

@Data
public class ProjectFileVO {
	private String wfolderFileNum;
	private String wfolderNum;
	private String attatchNum;

	private List<AttatchVO> attatchVO;

	private String searchType; // 검색 타입
	private String searchWord; // 검색 단어
}
