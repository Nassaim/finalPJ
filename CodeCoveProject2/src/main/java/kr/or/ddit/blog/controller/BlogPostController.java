package kr.or.ddit.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/blog")
public class BlogPostController {

	@PostMapping
	public String insertPost() {
		return "myblog/blodPost";
	}

	@PutMapping
	public String updatePost() {
		return "myblog/blogPost";
	}
}
