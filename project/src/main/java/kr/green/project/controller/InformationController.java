package kr.green.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.service.InformationService;
import kr.green.project.service.UserService;
import kr.green.project.vo.UserVo;

@Controller
public class InformationController {

	@Autowired
	UserService users;
	@Autowired
	InformationService infos;
	
	@RequestMapping(value= "/information/all", method = RequestMethod.GET)
	public ModelAndView userInformationGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		mv.addObject("userInform", infos.getUserInform(user.getId()));
		mv.addObject("menu", "all");
	    mv.setViewName("/information/all");
	    return mv;
	}
	
	@RequestMapping(value= "/information/account", method = RequestMethod.GET)
	public ModelAndView accountInformationGet(ModelAndView mv, HttpServletRequest h){
		mv.addObject("addressList", infos.getAddressList(h));
		mv.addObject("menu", "account");
	    mv.setViewName("/information/account");
	    return mv;
	}
	
	@RequestMapping(value= "/information/account", method = RequestMethod.POST)
	public ModelAndView accountInformationPost(ModelAndView mv, HttpServletRequest h, String pw){
		users.updateUserPw(h, pw);
	    mv.setViewName("redirect:/information/account");
	    return mv;
	}
	
	@RequestMapping("/pwCheck")
	@ResponseBody
	public Map<Object, Object> pwCheck(@RequestBody String pw, HttpServletRequest h){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = (UserVo)h.getSession().getAttribute("user");
	    map.put("pwCheck", infos.isPw(pw, user.getId()));
	    return map;
	}
	
	@RequestMapping("/pwCompare")
	@ResponseBody
	public Map<Object, Object> pwCompare(@RequestBody String pw, HttpServletRequest h){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = (UserVo)h.getSession().getAttribute("user");
	    map.put("pwCompare", infos.comparePw(pw, user.getId()));
	    return map;
	}
	
	@RequestMapping(value= "/information/level", method = RequestMethod.GET)
	public ModelAndView levelInformationGet(ModelAndView mv){
		mv.addObject("menu", "level");
	    mv.setViewName("/information/level");
	    return mv;
	}
	
	@RequestMapping(value= "/information/coupon", method = RequestMethod.GET)
	public ModelAndView couponInformationGet(ModelAndView mv){
		mv.addObject("menu", "coupon");
	    mv.setViewName("/information/coupon");
	    return mv;
	}
	
	@RequestMapping(value= "/information/point", method = RequestMethod.GET)
	public ModelAndView pointInformationGet(ModelAndView mv){
		mv.addObject("menu", "point");
	    mv.setViewName("/information/point");
	    return mv;
	}
	
	@RequestMapping(value= "/information/purchaseList", method = RequestMethod.GET)
	public ModelAndView purchaseListInformationGet(ModelAndView mv){
		mv.addObject("menu", "purchaseList");
	    mv.setViewName("/information/purchaseList");
	    return mv;
	}
	
	@RequestMapping(value= "/information/vaginal", method = RequestMethod.GET)
	public ModelAndView vaginalInformationGet(ModelAndView mv){
		mv.addObject("menu", "vaginal");
	    mv.setViewName("/information/vaginal");
	    return mv;
	}
	
	@RequestMapping(value= "/information/shoppingBasket", method = RequestMethod.GET)
	public ModelAndView shoppingBasketInformationGet(ModelAndView mv){
		mv.addObject("menu", "shoppingBasket");
	    mv.setViewName("/information/shoppingBasket");
	    return mv;
	}
	
	@RequestMapping(value= "/information/review", method = RequestMethod.GET)
	public ModelAndView reviewInformationGet(ModelAndView mv){
		mv.addObject("menu", "review");
	    mv.setViewName("/information/review");
	    return mv;
	}
}
