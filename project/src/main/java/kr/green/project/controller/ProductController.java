package kr.green.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.service.ProductService;
import kr.green.project.service.RootService;
import kr.green.project.vo.UserVo;

@Controller
public class ProductController {

	@Autowired
	ProductService pros;
	@Autowired
	RootService roots;
	
	@RequestMapping(value= "/product/detail", method = RequestMethod.GET)
	public ModelAndView productDtailGet(ModelAndView mv, HttpServletRequest h, String productCode){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
			mv.addObject("enrollment", roots.getEnrollmentString(productCode));
			mv.addObject("product", roots.getProduct(productCode));
			mv.addObject("colorList", roots.getOptionColor(productCode));
			mv.addObject("sizeList", roots.getOptionSize(productCode));
			mv.setViewName("/product/detail");
	    return mv;
	}
	
	
}
