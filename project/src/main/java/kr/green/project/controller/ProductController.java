package kr.green.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.pagination.ProductCri;
import kr.green.project.service.ProductService;
import kr.green.project.service.RootService;
import kr.green.project.vo.ProductenrollmentVo;

@Controller
public class ProductController {

	@Autowired
	ProductService pros;
	@Autowired
	RootService roots;
	
	@RequestMapping(value= "/product/detail", method = RequestMethod.GET)
	public ModelAndView productDtailGet(ModelAndView mv, String productCode, ProductCri cri){
		ProductenrollmentVo enrollment = roots.getEnrollmentString(productCode);
			mv.addObject("cri", cri);
			mv.addObject("enrollment", enrollment);
			mv.addObject("product", roots.getProduct(productCode));
			mv.addObject("colorList", roots.getOptionColor(productCode));
			mv.addObject("sizeList", pros.getContentSize(enrollment.getNum()));
			mv.addObject("remark", pros.getContentRemark(enrollment.getNum()));
			mv.addObject("sizeText", pros.getContentSizeText(enrollment.getNum()));
			mv.addObject("thumbnail", pros.getThumbnailImage(enrollment.getNum()));
			mv.addObject("image", pros.getContentImage(enrollment.getNum()));
			mv.setViewName("/product/detail");
	    return mv;
	}
	
	
}
