package kr.green.spring.controller;

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
	    if(userService.signup(user)) {
	    	mv.setViewName("redirect:/");
	    }else {
	    	mv.setViewName("redirect:/user/signup");
	    	mv.addObject("user",user);
	    }
	    return mv;
	}
	
	@RequestMapping(value = "/user/signout", method = RequestMethod.GET)
	public ModelAndView userSignoutGet(ModelAndView mv, HttpServletRequest request) {
	    mv.setViewName("redirect:/");
	    request.getSession().removeAttribute("user");
	    return mv;
	}
	
	@RequestMapping(value ="/idCheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = userService.getUser(id);
	    boolean check = user == null ? true : false;
	    map.put("check", check);
	    return map;
	}
	
	@RequestMapping(value ="/test")
	@ResponseBody
	public Map<Object, Object> test(@RequestBody TestVo test){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    System.out.println(test);
	    map.put("res","success");
	    return map;
	}
}
class TestVo{
	private String id;
	private int num;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "TestVo [id=" + id + ", num=" + num + "]";
	}
}