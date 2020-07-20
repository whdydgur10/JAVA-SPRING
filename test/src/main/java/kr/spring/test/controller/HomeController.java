package kr.spring.test.controller;


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
	public ModelAndView homeGet(ModelAndView mv, UserVo inputUser) {
		mv.setViewName("/main/home");
		return mv;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ModelAndView homePost(ModelAndView mv, UserVo login) {
		System.out.println(login);
		System.out.println(userService.getUser(login.getId()));
		if(userService.login(login) != null) {
			System.out.println("성공");
			mv.setViewName("redirect:/board/list");
		}
		else
			System.out.println("실패");
		mv.setViewName("redirect:/");
		return mv;
	}
	
}
