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

import kr.green.project.pagination.ProductCri;
import kr.green.project.service.ProductService;
import kr.green.project.service.RootService;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductenrollmentVo;
import kr.green.project.vo.UserVo;

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
	
	@RequestMapping("/enrollment/optionCode")
	@ResponseBody
	public Map<Object, Object> enrollmentOptionCode(@RequestBody OptionVo option){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    OptionVo op = roots.getOption(option.getProductCode(), option.getSize(), option.getColor());
	    map.put("optionCode", op.getOptionCode());
	    return map;
	}

	
	@RequestMapping(value= "/product/detail", method = RequestMethod.POST)
	public ModelAndView productDtailPost(ModelAndView mv, HttpServletRequest h, String enrollmentNum, String[] optionCode, String[] purchase, String where, ProductCri cri){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(optionCode.length == 0)
			mv.setViewName("/product/detail");
		else if(where.equals("list")) {
			mv.setViewName("/product/purchase");	
		}
		else {
			pros.insertShoppingBasket(user.getId(), enrollmentNum, optionCode, purchase);
			if(where.equals("goBasket")) {
				mv.setViewName("/product/shoppingBasket");
			}
			else if(where.equals("noBasket")) {
				mv.setViewName("redirect:/");
			}
		}
		for(String tmp : optionCode) {
			System.out.println(tmp);
		}
		for(String tmp : purchase) {
			System.out.println(tmp);
		}
	    return mv;
	}
	
}
