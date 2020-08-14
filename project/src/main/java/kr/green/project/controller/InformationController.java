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
import kr.green.project.subVo.UserVaginalVo;
import kr.green.project.vo.AddressVo;
import kr.green.project.vo.UserVo;
import kr.green.project.vo.VaginalVo;

@Controller
public class InformationController {

	@Autowired
	UserService users;
	@Autowired
	InformationService infos;
	
	@RequestMapping(value= "/information/all", method = RequestMethod.GET)
	public ModelAndView userInformationGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			mv.addObject("userInform", infos.getUserInform(user.getId()));
			mv.addObject("couponList", infos.getCouponList(user.getId()));
			mv.addObject("menu", "all");
		    mv.setViewName("/information/all");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/information/account", method = RequestMethod.GET)
	public ModelAndView accountInformationGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			mv.addObject("mainAddress", infos.getMainAddress(h));
			mv.addObject("subAddressList", infos.getSubAddressList(h));
			mv.addObject("addressList", infos.getaddressList(h));
			mv.addObject("menu", "account");
		    mv.setViewName("/information/account");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/information/account/pw", method = RequestMethod.POST)
	public ModelAndView accountInformationPwPost(ModelAndView mv, HttpServletRequest h, String pw){
		UserVo user = (UserVo) h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			if(!pw.equals("")) 
				users.updateUserPw(user, pw);
			mv.setViewName("redirect:/information/account");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/information/account/phone", method = RequestMethod.POST)
	public ModelAndView accountInformationPhonePost(ModelAndView mv, HttpServletRequest h, String phone){
		UserVo user = (UserVo) h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			if(!phone.equals(""))
				users.updateUserPhone(user, phone);
			mv.setViewName("redirect:/information/account");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/information/account/address", method = RequestMethod.POST)
	public ModelAndView accountInformationAddressPost(ModelAndView mv, HttpServletRequest h, AddressVo address){
		UserVo user = (UserVo) h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			if(!address.getAddress().equals(""))
				infos.insertAddress(user, address);
			mv.setViewName("redirect:/information/account");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/information/account/addressOption", method = RequestMethod.POST)
	public ModelAndView accountInformationAddressOptionPost(ModelAndView mv, HttpServletRequest h, int num, String option){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			if(option.equals("newMain"))
				infos.updateIsMain(user, num);
			else if(option.equals("deleteAddress"))
				infos.deleteAddress(num);
			mv.setViewName("redirect:/information/account");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/information/account/deleteAccount", method = RequestMethod.GET)
	public ModelAndView accountInformationDeleteAccountPost(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			users.deleteUser(user.getId());
			h.getSession().removeAttribute("user");
			mv.setViewName("redirect:/");
		}
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
	public ModelAndView levelInformationGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			mv.addObject("level", infos.getLevel(user.getId()));
			mv.addObject("purchase", infos.getPurchasePrice(user.getId()));
			mv.addObject("menu", "level");
			mv.addObject("pointList", infos.getPointList());
			mv.addObject("usePoint", infos.getUsePoint(user.getId()));
			mv.addObject("remain", infos.getRemainPrice(user.getId()));
			mv.addObject("userInform", infos.getUserInform(user.getId()));
			mv.addObject("purchaseList", infos.getPurchase(user.getId()));
			mv.addObject("usePointList", infos.getUsePointPurchase(user.getId()));
		    mv.setViewName("/information/level");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/information/coupon", method = RequestMethod.GET)
	public ModelAndView couponInformationGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			mv.addObject("couponList", infos.getCouponList(user.getId()));
			mv.addObject("useCouponList", infos.getUseCouponList(user.getId()));
			mv.addObject("menu", "coupon");
		    mv.setViewName("/information/coupon");
		}
	    return mv;
	}
	
	@RequestMapping("/codeCheck")
	@ResponseBody
	public Map<Object, Object> codecheck(@RequestBody String code, HttpServletRequest h){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = (UserVo)h.getSession().getAttribute("user");
	    map.put("codeCheck", infos.isCouponCode(code, user.getId()));
	    return map;
	}
	
	@RequestMapping(value= "/information/coupon", method = RequestMethod.POST)
	public ModelAndView couponInformationPost(ModelAndView mv, HttpServletRequest h, String code){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			infos.insertCoupon(user.getId(), code);
			mv.addObject("menu", "coupon");
		    mv.setViewName("redirect:/information/coupon");
		}
		return mv;
	}
	
	@RequestMapping(value= "/information/purchaseList", method = RequestMethod.GET)
	public ModelAndView purchaseListInformationGet(ModelAndView mv, HttpServletRequest h){
		mv.addObject("menu", "purchaseList");
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			mv.addObject("purchaseList", infos.getPurchaseList(user.getId()));
		    mv.setViewName("/information/purchaseList");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/information/vaginal", method = RequestMethod.GET)
	public ModelAndView vaginalInformationGet(ModelAndView mv, HttpServletRequest h){
		mv.addObject("menu", "vaginal");
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			mv.addObject("vaginalList", infos.getVaginalList(user.getId()));
		    mv.setViewName("/information/vaginal");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/information/shoppingBasket", method = RequestMethod.GET)
	public ModelAndView shoppingBasketInformationGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user == null)
			mv.setViewName("redirect:/");
		else {
			mv.addObject("menu", "shoppingBasket");
		    mv.setViewName("/information/shoppingBasket");
		}
	    return mv;
	}
	
}
