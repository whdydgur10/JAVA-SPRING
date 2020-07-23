package kr.spring.test.controller;

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
	
//	@RequestMapping(value = "/user/signup", method = RequestMethod.POST)
//	public ModelAndView userSignupPost(ModelAndView mv, UserVo user, String emailId, String emailSite) {
//		user.setEmail(emailId + "@" + emailSite);
//		if(userService.getId(user)) {
//			mv.setViewName("redirect:/");
//		}
//		else {
//			mv.setViewName("redirect:/user/signup");
//		}
//		return mv;
//	}
	
	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public ModelAndView userLogoutGet(ModelAndView mv, HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping(value ="/idCheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id){
	    Map<Object, Object> map = new HashMap<Object, Object>();
//	    UserVo user = userService.getUser(id);
	    map.put("idCheck",userService.getUser(id)==null);
//	    if(user == null) {
//	    	map.put("idCheck",true);
//	    }
//	    else {
//	    	map.put("idCheck",false);
//	    }
	    return map;
	}
	
	@RequestMapping(value ="/signup", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> signup(@RequestBody UserVo user){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    userService.getId(user);
	    return map;
	}
}
