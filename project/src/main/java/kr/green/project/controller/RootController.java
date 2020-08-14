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

import kr.green.project.pagination.RootCri;
import kr.green.project.service.RootService;
import kr.green.project.vo.ProductVo;
import kr.green.project.vo.UserVo;

@Controller
public class RootController {

	@Autowired
	RootService roots;
	
	@RequestMapping(value= "/root/page", method = RequestMethod.GET)
	public ModelAndView rootGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else
			mv.setViewName("/root/page");
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/register", method = RequestMethod.GET)
	public ModelAndView rootProductRegisterGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else
			mv.setViewName("/root/product/register");
	    return mv;
	}
	
	@RequestMapping("/root/codeCheck")
	@ResponseBody
	public Map<Object, Object> codecheck(@RequestBody String code){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("codeCheck", roots.isProductCode(code));
	    return map;
	}
	
	@RequestMapping(value= "/root/product/register", method = RequestMethod.POST)
	public ModelAndView rootProductRegisterPost(ModelAndView mv, HttpServletRequest h, ProductVo product, String[] size, String[] color){
		roots.insertProduct(product, size, color);
		mv.setViewName("redirect:/");
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/amount", method = RequestMethod.GET)
	public ModelAndView rootProductAmountGet(ModelAndView mv, HttpServletRequest h, String productCode, RootCri rootCri, String group, String order){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			mv.addObject("rootPage", roots.getRootPage(productCode, rootCri));
			mv.addObject("group", group);
			mv.addObject("order", order);
			mv.addObject("productCode", productCode);
			mv.addObject("productList", roots.getProductOptionList(productCode, rootCri));
			mv.setViewName("/root/product/amount");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/amount", method = RequestMethod.POST)
	public ModelAndView rootProductAmountPost(ModelAndView mv, HttpServletRequest h, String[] optionCode, int[] amount){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			roots.updateAmount(optionCode, amount);
			mv.setViewName("redirect:/root/product/amount");
		}
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/update", method = RequestMethod.GET)
	public ModelAndView rootProductUpdateGet(ModelAndView mv, HttpServletRequest h, String productCode){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else {
			System.out.println(roots.getOptionSize(productCode));
			mv.addObject("size", roots.getOptionSize(productCode));
			mv.addObject("color", roots.getOptionColor(productCode));
			mv.addObject("product", roots.getProduct(productCode));
			mv.setViewName("/root/product/update");
		}
	    return mv;
	}
}
