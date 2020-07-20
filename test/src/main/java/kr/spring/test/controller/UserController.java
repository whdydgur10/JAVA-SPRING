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

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/user/signup", method = RequestMethod.GET)
	public ModelAndView userSignupGet(ModelAndView mv) {
		mv.setViewName("/user/signup");
		return mv;
	}
	
	@RequestMapping(value = "/user/signup", method = RequestMethod.POST)
	public ModelAndView userSignupPost(ModelAndView mv, UserVo user, String emailId, String emailSite) {
		user.setEmail(emailId + "@" + emailSite);
		if(userService.getId(user)) {
			mv.setViewName("redirect:/");
		}
		else {
			mv.setViewName("redirect:/user/signup");
		}
		return mv;
	}
}
