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
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView home(ModelAndView mv, UserVo inputUser) {
		mv.setViewName("/main/home");
		UserVo user = userService.isUser(inputUser);
		mv.addObject("id",inputUser.getId());
		if(user == null) {
			mv.addObject("isLogin",false);
		}
		System.out.println(user);
		return mv;
	}
	@RequestMapping(value = "/user/signin", method = RequestMethod.GET)
	public ModelAndView userSigninGet(ModelAndView mv) {
		logger.info("URI:/user/signin");
		mv.setViewName("/user/signin");
		return mv;
	}
	@RequestMapping(value = "/user/signup", method = RequestMethod.GET)
	public ModelAndView userSignupGet(ModelAndView mv) {
		logger.info("URI:/user/signup");
		mv.setViewName("/user/signup");
		return mv;
	}
	
}
