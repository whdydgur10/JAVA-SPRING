package kr.spring.test.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.test.service.UserService;
import kr.spring.test.vo.UserVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView homeGet(ModelAndView mv, UserVo inputUser, HttpServletRequest r) {
		mv.setViewName("/main/home");
		HttpSession session = r.getSession();
		System.out.println(session.getAttribute("user"));
		return mv;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ModelAndView signinPost(ModelAndView mv, UserVo login) {
		UserVo user = userService.login(login);
		if(user != null) {
			mv.setViewName("redirect:/board/list");
			mv.addObject("user", user);
		}
		else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
}
