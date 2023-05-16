package kr.or.ddit.blog.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/blog")
@MultipartConfig
public class BlogImageController {

	@Inject
	WebApplicationContext rootcontext;

	private File imageFolder;

	@PostMapping(value = "uploadFile", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> fileURL(MultipartFile image, HttpServletRequest request) {

		// 상품 이미지 저장 처리(MultipartFile)
		String imageFolderUrl = "/resources/postImages";
		String iamgeFolderPath = rootcontext.getServletContext().getRealPath(imageFolderUrl);
		imageFolder = new File(iamgeFolderPath);
		if (!imageFolder.exists())
			imageFolder.mkdirs();

		if (!image.isEmpty()) {// 이미지 폴더파일이 저장되었다면
			File postImageFile = new File(imageFolder, image.getOriginalFilename());
			try {
				image.transferTo(postImageFile);
			} catch (IllegalStateException | IOException e) {
				throw new RuntimeException(e);
			}
		}

		String url = request.getContextPath() + "/resources/postImages/" + image.getOriginalFilename();

		Map<String, Object> respMap = new HashMap<String, Object>();
		Map<String, String> fileMap = new HashMap<String, String>();

		respMap.put("success", 1);
		fileMap.put("url", url);
		respMap.put("file", fileMap);
		return respMap;
	}
}
