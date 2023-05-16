package kr.or.ddit.common.attatch.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.common.AttatchVO;
import kr.or.ddit.common.attatch.service.AttatchService;

@Controller
@RequestMapping("/coco/attatch")
public class AttatchDeleteController {

	@Inject
	private AttatchService attatchService;
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ResponseEntity<String> workFileDelete(AttatchVO attatch){
		attatchService.workFileDelete(attatch);
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
}
