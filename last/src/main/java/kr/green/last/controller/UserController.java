package kr.green.last.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.last.service.UserService;
import kr.green.last.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/user/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv) {
		mv.setViewName("/user/signup");
		return mv;
	}
	
	@RequestMapping(value = "/user/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, UserVo user) {
		if(userService.getUser(user) != null || user == null)
			mv.setViewName("redirect:/user/signup");
		else {
			userService.insertUser(user);
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	@RequestMapping(value ="/idCheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("idCheck",(userService.isUser(id) == false));
	    return map;
	}
	
	@RequestMapping(value = "/user/signin", method = RequestMethod.GET)
	public ModelAndView signinGet(ModelAndView mv) {
		mv.setViewName("/user/signin");
		return mv;
	}
	
	@RequestMapping(value = "/user/signin", method = RequestMethod.POST)
	public ModelAndView signinPost(ModelAndView mv, UserVo user) {
		UserVo dbUser = userService.login(user);
		if( dbUser != null) {
			mv.addObject("user",dbUser);
			mv.setViewName("redirect:/");
		}else
			mv.setViewName("redirect:/user/signin");
		return mv;
	}
	
	@RequestMapping(value = "/user/signout", method = RequestMethod.GET)
	public ModelAndView signoutGet(ModelAndView mv, HttpServletRequest r) {
		r.getSession().removeAttribute("user");
		mv.setViewName("redirect:/");
		return mv;
	}
}