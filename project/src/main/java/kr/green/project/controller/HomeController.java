package kr.green.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value= "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv){
	    mv.setViewName("/main/home");
	    mv.addObject("setHeader", "타일즈");
	    return mv;
	}

	@RequestMapping(value= "/user/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv){
	    mv.setViewName("/user/signup");
	    mv.addObject("setHeader", "타일즈");
	    return mv;
	}
	
//	@RequestMapping("/member/dup")
//	@ResponseBody
//	public Map<Object, Object> idcheck(@RequestBody String id){
//	    int count = 0;
//	    Map<Object, Object> map = new HashMap<Object, Object>();
//	    if(userService.checkUser(id))
//	        count = 1;
//	    map.put("cnt", count);
//	    System.out.println(id);
//	    return map;
//	}
}
