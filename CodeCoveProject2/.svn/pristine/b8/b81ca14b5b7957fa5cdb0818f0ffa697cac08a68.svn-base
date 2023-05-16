package kr.or.ddit.blog.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.RoleGroup;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.blog.service.MyBlogService;
import kr.or.ddit.blog.vo.BlogCateVO;
import kr.or.ddit.blog.vo.TodoVO;
import kr.or.ddit.common.CheckMember;
import kr.or.ddit.common.exception.NotAuthorityException;
import kr.or.ddit.mapper.blog.MyBlogMapper;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/blog/{memId}")
public class TodoListController {

	@Inject
	MyBlogService blogService;
	@Inject
	MyBlogMapper myBlogMapper;
	@Inject
	CheckMember check;

	@ModelAttribute("blogCateList")
	public List<BlogCateVO> blogCateList(@PathVariable("memId") String memId, Model model) {
		List<BlogCateVO> blogCateList = blogService.retrieveCate(memId);
		model.addAttribute("memId", memId);
		return blogCateList;
	}

	// 투두리스트
	@GetMapping("todo")
	public String todoPage(@PathVariable("memId") String memId, Model model) {
		String viewName = null;

		RoleGroup result = check.checkBlog(memId);
		switch (result) {
		case OWNER:
			String blogId = myBlogMapper.selectBlogId(memId);
			model.addAttribute("blogId", blogId);
			viewName = "myblog/todoList";

			break;
		case NOTOWNER:
			throw new NotAuthorityException();

		case GUEST:
			viewName = "redirect:/login";
			break;

		}

		return viewName;
	}

	@ResponseBody
	@GetMapping(value = "todoList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Map<String, Object> todoList(@PathVariable("memId") String memId, @RequestParam("checkYn") String checkYn,
			@RequestParam("date") String date) {

		Map<String, Object> resultMap = null;

		RoleGroup result = check.checkBlog(memId);
		if (result.equals(RoleGroup.OWNER)) {
			if (StringUtils.isBlank(date)) {
				String now = LocalDate.now().toString();
				date = now;
			}

			Map<String, String> map = new HashMap<String, String>();
			map.put("memId", memId);
			map.put("checkYn", checkYn);
			map.put("date", date);

			List<TodoVO> todoList = blogService.retrieveTodo(map);
			int checkAllList = myBlogMapper.dailyCheckAllList(map);
			int yList = myBlogMapper.dailyCheckYList(map);

			int percent = 0;
			if (checkAllList != 0) {
				percent = (int) ((double) yList / checkAllList * 100);
			}

			resultMap = new HashMap<String, Object>();
			resultMap.put("todoList", todoList);
			resultMap.put("percent", percent);
		} else {
			throw new NotAuthorityException();
		}

		return resultMap;
	}

	@ResponseBody
	@GetMapping(value = "addTodo", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public void addTodo(@RequestParam("blogId") String blogId, @RequestParam("addTodo") String addTodo,
			@PathVariable("memId") String memId, @RequestParam("date") String date) {

		TodoVO todo = new TodoVO();
		todo.setBlogId(blogId);
		todo.setCheckContent(addTodo);
		if (StringUtils.isNotBlank(date)) {
			todo.setCheckDate(date);
		}

		blogService.addTodo(todo);
	}

	@ResponseBody
	@GetMapping(value = "upTodo", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int upTodo(@RequestParam("checkNum") String checkNum, @RequestParam("upData") String upData,
			@PathVariable("memId") String memId) {

		int resultNum = 0;

		RoleGroup result = check.checkBlog(memId);
		if (result.equals(RoleGroup.OWNER)) {
			TodoVO todo = new TodoVO();
			todo.setCheckNum(checkNum);
			todo.setCheckContent(upData);

			ServiceResult upTodo = blogService.upTodo(todo);
			resultNum = alarmNum(upTodo);

		} else {
			throw new NotAuthorityException();
		}

		return resultNum;
	}

	@ResponseBody
	@GetMapping(value = "ynTodo", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int ynTodo(@RequestParam("checkNum") String checkNum, @RequestParam("checkYn") String checkYn,
			@PathVariable("memId") String memId) {

		int resultNum = 0;

		RoleGroup result = check.checkBlog(memId);
		if (result.equals(RoleGroup.OWNER)) {
			TodoVO todo = new TodoVO();
			todo.setCheckNum(checkNum);
			if (checkYn.equals("N"))
				todo.setCheckYn("Y");
			if (checkYn.equals("Y"))
				todo.setCheckYn("N");

			ServiceResult ynTodo = blogService.ynTodo(todo);
			resultNum = alarmNum(ynTodo);
		} else {
			throw new NotAuthorityException();
		}

		return resultNum;
	}

	@ResponseBody
	@GetMapping(value = "delTodo", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int delTodo(@RequestParam("checkNum") String checkNum, @PathVariable("memId") String memId) {

		int resultNum = 0;

		RoleGroup result = check.checkBlog(memId);
		if (result.equals(RoleGroup.OWNER)) {

			ServiceResult delTodo = blogService.delTodo(checkNum);
			resultNum = alarmNum(delTodo);

		} else {
			throw new NotAuthorityException();
		}

		return resultNum;
	}

	public int alarmNum(ServiceResult result) {
		int resultNum = 0;

		if (result.equals(ServiceResult.OK)) {
			resultNum = 1;
		} else {
			resultNum = 0;
		}

		return resultNum;
	}
}
