package kr.green.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.service.ProductService;
import kr.green.project.vo.ProductVo;
import kr.green.project.vo.UserVo;

@Controller
public class ProductController {

	@Autowired
	ProductService pros;
	
	@RequestMapping(value= "/product/register", method = RequestMethod.GET)
	public ModelAndView productRgisterGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user.getAuth() == 0) 
			mv.setViewName("redirect:/");
		else
			mv.setViewName("/product/register");
	    return mv;
	}
	
	@RequestMapping(value= "/product/register", method = RequestMethod.POST)
	public ModelAndView productRgisterPost(ModelAndView mv, HttpServletRequest h, ProductVo product, String[] size, String[] color){
		pros.insertProduct(product, size, color);
		mv.setViewName("redirect:/");
	    return mv;
	}
}
