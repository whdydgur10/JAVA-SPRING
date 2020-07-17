package kr.green.spring.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.spring.service.UserService;
import kr.green.spring.vo.UserVo;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value = "/user/signup", method = RequestMethod.GET)
	public ModelAndView userSignupGet(ModelAndView mv) {
	    mv.setViewName("/user/signup");
	    return mv;
	}
	
	@RequestMapping(value = "/user/signup", method = RequestMethod.POST)
	public ModelAndView userSignupPost(ModelAndView mv, UserVo user) {
	    mv.setViewName("/user/signup");
	    ArrayList<String> a = userService.getUserId();
	    boolean userId = userService.isUserId(user);
	    for(String tmp : a) {
	    	System.out.println(tmp);
	    	System.out.println(user.getId());
	    	System.out.println(tmp == user.getId());
	    }
	    if(userService.signup(user)) {
	    	mv.setViewName("redirect:/");
	    }else {
	    	mv.setViewName("redirect:/user/signup");
	    	mv.addObject("user",user);
	    	mv.addObject("userId",userId);
	    }
	    return mv;
	}
	
}
