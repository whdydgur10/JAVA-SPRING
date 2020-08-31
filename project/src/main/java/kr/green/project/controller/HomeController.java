package kr.green.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.pagination.ProductCri;
import kr.green.project.service.InformationService;
import kr.green.project.service.ProductService;
import kr.green.project.service.UserService;
import kr.green.project.vo.UserVo;

@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	@Autowired
	InformationService infos;
	@Autowired
	ProductService pros;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value= "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv, HttpServletRequest h, ProductCri cri){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user == null) {
			if(cri.getMainCategory().equals(""))
				cri.setMainCategory("MW");
			mv.addObject("cri", cri);
			mv.addObject("list", pros.getProductEnrollmentList(cri));
			mv.addObject("pageMaker", pros.getProductPage(cri));
		}
		else {
			if(cri.getMainCategory().equals(""))
				cri.setMainCategory(user.getGender());
			mv.addObject("cri", cri);
			mv.addObject("list", pros.getProductEnrollmentList(cri));
			mv.addObject("pageMaker", pros.getProductPage(cri));
		}
	    mv.setViewName("/main/home");
	    return mv;
	}

	@RequestMapping(value= "/user/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv){
	    mv.setViewName("/user/signup");
	    return mv;
	}
	
	@RequestMapping(value= "/user/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, UserVo user){
		if(user != null) {
			userService.insertUser(user);
			String code = "X5Q8411";
			infos.insertCoupon(user.getId(), code);
			mv.setViewName("redirect:/");
		}
		else
			mv.setViewName("redirect:/user/signup");
	    return mv;
	}
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("idCheck", userService.isUserId(id));
	    return map;
	}
	
	@RequestMapping(value= "/user/signin", method = RequestMethod.GET)
	public ModelAndView signinGet(ModelAndView mv){
	    mv.setViewName("/user/signin");
	    return mv;
	}
	
	@RequestMapping(value= "/user/signin", method = RequestMethod.POST)
	public ModelAndView signinPost(ModelAndView mv, UserVo user){
		if(user != null) {
			UserVo user2 = userService.getUser(user);
			if(user2 != null) {
				mv.addObject("user", user2);
				mv.setViewName("redirect:/");
			}else
				mv.setViewName("redirect:/user/signin");
		}else
			mv.setViewName("redirect:/user/signin");
	    return mv;
	}
	
	@RequestMapping(value= "/user/signout", method = RequestMethod.GET)
	public ModelAndView signoutGet(ModelAndView mv, HttpServletRequest h){
		h.getSession().removeAttribute("user");
	    mv.setViewName("redirect:/");
	    return mv;
	}
	
	
}
