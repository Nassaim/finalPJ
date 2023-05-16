package kr.or.ddit.blog.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.blog.service.MyBlogService;
import kr.or.ddit.blog.service.MyCalendarService;
import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.MyCalendarVO;

@Controller
@RequestMapping("/blog/{memId}/calendar")
public class MyCalendarController {
	@Inject
	MyCalendarService calendarService;

	@Inject
	MyBlogService blogService;

	@ModelAttribute("myCalendarVO")
	public MyCalendarVO getCalendarVO() {
		return new MyCalendarVO();
	}

	// 사이드메뉴
	@ModelAttribute("blogCateList")
	public List<BlogCateVO> blogCateList(@PathVariable("memId") String memId) {
		List<BlogCateVO> blogCateList = blogService.retrieveCate(memId);
		return blogCateList;
	}

	@GetMapping
	public String getMyCalList(@PathVariable String memId) {
//		시큐리티 구현 필요
//		String viewName = null;
//		if (SecurityContextHolder.getContext().getAuthentication().isAuthenticated()
//				&& !SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
//			MemberVO mv = ((MemberPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal())
//					.getRealMember();
//			if (memId.equals(mv.getMemId())) {
//				viewName = "myblog/calendar";
//			} else {
//				viewName = "myblog/check";
//			}
//		} else {
//			viewName = "redirect:/login";
//		}
//		return viewName;
		return "myblog/calendar";
	}

	@GetMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<Map<String, Object>> getMyCalLJsonList(@PathVariable("memId") String memId, Model model) {
		// 로그인한 회원의 정보 가져오기
//		시큐리티 구현 필요
//		MemberVO mv = ((MemberPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal())
//				.getRealMember();
//		String sessionId = mv.getMemId();

		// 회원의 캘린더 가져오기
		//List<MyCalendarVO> MycalList = calendarService.retriveMycalList(sessionId);
		List<MyCalendarVO> MycalList = calendarService.retriveMycalList(memId);
		Calendar cal = Calendar.getInstance();

		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
		List<Map<String, Object>> list = new ArrayList<>();

		for (MyCalendarVO single : MycalList) {
			Map<String, Object> map = new HashMap<>();
			map.put("calId", single.getCalNum());
			map.put("title", single.getCalTitle());
			map.put("content", single.getCalContent());
			Date startDay = null;
			try {
				startDay = sdf.parse(single.getCalStartDate());
				cal.setTime(startDay);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if (sdf.format(cal.getTime()).toString().equals(single.getCalEndDate())) {
				map.put("textColor", "#000000");
			} else {
				map.put("color", single.getCalColor());
			}
			map.put("start", single.getCalStartDate());
			map.put("end", single.getCalEndDate());
			map.put("calNum", single.getCalNum());
			list.add(map);
		}
		return list;
	}

	// 일정등록
	@PostMapping
	public String insertMyCalList(@ModelAttribute MyCalendarVO myCalendarVO, Errors errors, @PathVariable String memId,
			SessionStatus sessionStatus, RedirectAttributes redirectAttributes) {
//		시큐리티 구현 필요
//		MemberVO mv = ((MemberPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal())
//				.getRealMember();
		if (!errors.hasErrors()) {
//			String sessionId = mv.getMemId();
//			myCalendarVO.setBloggerId(sessionId);
			myCalendarVO.setBloggerId(memId);
			int cnt = calendarService.createMyCal(myCalendarVO);
			if (cnt > 0) {
				redirectAttributes.addFlashAttribute("message", "일정등록이 되었습니다.");

			} else {
				redirectAttributes.addFlashAttribute("message", "일정등록에 실패했습니다. 다시 해주세요");
			}
		} else {
			redirectAttributes.addFlashAttribute("message", "입력이 누락되었거나 형식에 맞지않습니다.");

		}

		return "redirect:/blog/{memId}/calendar";
	}

	// 일정수정
	@PostMapping("/updateCal")
	public String updateCalList(@ModelAttribute MyCalendarVO myCalendarVO, Errors errors, Model model,
			RedirectAttributes redirectAttributes) {
		if (!errors.hasErrors()) {
			int cnt = calendarService.modifyCalendar(myCalendarVO);
			if (cnt > 0) {
				redirectAttributes.addFlashAttribute("message", "수정 되었습니다.");

			} else {
				redirectAttributes.addFlashAttribute("message", "일정수정 실패, 다시 해주세요");
			}

		} else {
			redirectAttributes.addFlashAttribute("message", "입력이 누락되었거나 형식에 맞지않습니다.");

		}
		return "redirect:/blog/{memId}/calendar";
	}

	// 일정 삭제
	@PostMapping("/deleteCal")
	public String deleteCalendar(@ModelAttribute MyCalendarVO myCalendarVO, Errors errors,
			RedirectAttributes redirectAttributes) {
		if (!errors.hasErrors()) {
			int cnt = calendarService.removeCalendar(myCalendarVO.getCalNum());
			if (cnt > 0) {
				redirectAttributes.addFlashAttribute("message", "삭제 되었습니다");

			} else {
				redirectAttributes.addFlashAttribute("message", "일정삭제 실패, 다시 해주세요");

			}
		} else {
			redirectAttributes.addFlashAttribute("message", "삭제할 일정이 없습니다.");

		}
		return "redirect:/blog/{memId}/calendar";

	}
}
