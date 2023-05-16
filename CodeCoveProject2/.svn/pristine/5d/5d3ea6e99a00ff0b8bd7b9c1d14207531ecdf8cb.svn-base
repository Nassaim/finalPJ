package kr.or.ddit.project.project.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.project.project.service.IJProjectService;
import kr.or.ddit.project.project.vo.ProjectVO;
import kr.or.ddit.project.work.service.IWorkService;
import kr.or.ddit.project.work.vo.WorkVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coco/project")
public class ExcelController {
	
	@Inject
	private IWorkService workService;

	@PostMapping("/excelDownload")
	public void excelDownload(String pjId, HttpServletResponse response) throws Exception{
		//엑셀에 실제로 담을 데이터  페이징 없이 전체 데이터를  list로
		
		
		//다운로드 시 vo에 추가해주고 @ExcelColumn어노테이션 추가해주세요
		List<WorkVO> list = workService.list(pjId);
		
		SimpleExcelFile simpleExcelFile= new SimpleExcelFile("모듈테스트", WorkVO.class, list);
		//생성자에서 sheet이름, columnName, Body생성
		 
		// 컨텐츠 타입과 파일명 지정
		String currentTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
		String fileName = "workList" + currentTime + ".xlsx";
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename="+fileName);
		simpleExcelFile.write(response.getOutputStream());
	}
	
}
