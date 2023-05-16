package kr.or.ddit.blog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TempController {
	
	@GetMapping("/blog.do")
	public String blogMainView() {
		return "blogs/content";
	}
	
	@GetMapping("/myLike.do")
	public String blogMylike() {
		return "blogs/myLike";
	}
	
	@GetMapping("/posting.do")
	public String blogPosting() {
		return "blogs/posting";
	}
	
	@GetMapping("/calendar.do")
	public String blogCalendar() {
		return "blogs/calendar";
	}
	
	
}
