package kr.green.project.controller;

import java.util.ArrayList;
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
import kr.green.project.vo.CategoryVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductVo;
import kr.green.project.vo.ProductenrollmentVo;
import kr.green.project.vo.UserVo;

@Controller
public class RootController {

	@Autowired
	RootService roots;
	
	@RequestMapping(value= "/root/page", method = RequestMethod.GET)
	public ModelAndView rootGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
//		if(user == null)
//			mv.setViewName("redirect:/");
//		else {
//			if(user.getAuth() == 0) 
//				mv.setViewName("redirect:/");
//			else
				mv.setViewName("/root/page");
//		}
	    return mv;
	}
	
	@RequestMapping(value= "/root/page", method = RequestMethod.POST)
	public ModelAndView rootPost(ModelAndView mv,String mainCategory, String middleCategory, String[] subCategory ){
		for(String tmp : subCategory) {
			roots.insertCategory(mainCategory, middleCategory, tmp);
		}
		mv.setViewName("/root/page");
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/register", method = RequestMethod.GET)
	public ModelAndView rootProductRegisterGet(ModelAndView mv, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
//		if(user == null)
//			mv.setViewName("redirect:/");
//		else {
//			if(user.getAuth() == 0) 
//				mv.setViewName("redirect:/");
//			else
				mv.setViewName("/root/product/register");
//		}
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
		mv.setViewName("redirect:/root/page");
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/amount", method = RequestMethod.GET)
	public ModelAndView rootProductAmountGet(ModelAndView mv, HttpServletRequest h, String productCode, RootCri rootCri, String group, String order){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
//		if(user == null)
//			mv.setViewName("redirect:/");
//		else {
//			if(user.getAuth() == 0) 
//				mv.setViewName("redirect:/");
//			else {
				mv.addObject("rootPage", roots.getRootPage(productCode, rootCri));
				mv.addObject("group", group);
				mv.addObject("order", order);
				mv.addObject("productCode", productCode);
				mv.addObject("productCode", productCode);
				mv.addObject("productList", roots.getProductOptionList(productCode, rootCri));
				mv.setViewName("/root/product/amount");
//			}
//		}
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/amount", method = RequestMethod.POST)
	public ModelAndView rootProductAmountPost(ModelAndView mv, HttpServletRequest h, String[] optionCode, int[] amount){
		roots.updateAmount(optionCode, amount);
		mv.setViewName("redirect:/root/product/amount");
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/update", method = RequestMethod.GET)
	public ModelAndView rootProductUpdateGet(ModelAndView mv, HttpServletRequest h, String productCode){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
//		if(user == null)
//			mv.setViewName("redirect:/");
//		else {
//			if(user.getAuth() == 0) 
//				mv.setViewName("redirect:/");
//			else {
				mv.addObject("size", roots.getOptionSize(productCode));
				mv.addObject("color", roots.getOptionColor(productCode));
				mv.addObject("product", roots.getProduct(productCode));
				mv.setViewName("/root/product/update");
//			}
//		}
	    return mv;
	}
	
	@RequestMapping("/deleteSize")
	@ResponseBody
	public Map<Object, Object> deleteSize(@RequestBody OptionVo option){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    String size = option.getSize();
	    String productCode = option.getProductCode();
	    roots.deleteSize(size, productCode);
	    return map;
	}
	
	@RequestMapping("/deleteColor")
	@ResponseBody
	public Map<Object, Object> deleteColor(@RequestBody OptionVo option){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    String color = option.getColor();
	    String productCode = option.getProductCode();
	    roots.deleteColor(color, productCode);
	    return map;
	}
	
	@RequestMapping(value= "/root/product/update", method = RequestMethod.POST)
	public ModelAndView rootProductUpdatePost(ModelAndView mv, HttpServletRequest h, ProductVo product, String[] size, String[] color){
		product.setModify(roots.getProduct(product.getCode()).getModify() + 1);
		roots.updateProduct(product);
		roots.insertProduct(product, size, color);
		mv.setViewName("redirect:/root/page");
	    return mv;
	}
	
	@RequestMapping(value= "/root/product/enrollment", method = RequestMethod.GET)
	public ModelAndView rootProductEnrollmentGet(ModelAndView mv, HttpServletRequest h, String productCode){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
//		if(user == null)
//			mv.setViewName("redirect:/");
//		else {
//			if(user.getAuth() == 0) 
//				mv.setViewName("redirect:/");
//			else {
				mv.addObject("product", roots.getProduct(productCode));
				mv.setViewName("/root/product/enrollment");
//			}
//		}
	    return mv;
	}
	
	@RequestMapping("/enrollment/codeCheck")
	@ResponseBody
	public Map<Object, Object> enrollmentCodecheck(@RequestBody String code){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("codeCheck", roots.isEnrollmentProduct(code));
	    return map;
	}
	
	@RequestMapping("/enrollment/middleCategory")
	@ResponseBody
	public Map<Object, Object> enrollmentMiddleCategory(@RequestBody String category){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("middleCategory", roots.getMiddleCategoryList(category));
	    return map;
	}
	
	@RequestMapping("/enrollment/subCategory")
	@ResponseBody
	public Map<Object, Object> enrollmentSubCategory(@RequestBody CategoryVo category){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("subCategory", roots.getSubCategoryList(category));
	    return map;
	}
	
	@RequestMapping("/enrollment/categoryNum")
	@ResponseBody
	public Map<Object, Object> enrollmentCategoryNum(@RequestBody CategoryVo category){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("categoryNum", roots.getcategoryNum(category));
	    return map;
	}
	
	@RequestMapping("/enrollment/register")
	@ResponseBody
	public Map<Object, Object> enrollmentRegister(@RequestBody ProductenrollmentVo enrollment){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    roots.insertEnrollment(enrollment);
	    return map;
	}

	@RequestMapping(value= "/root/product/enrollmentContent", method = RequestMethod.GET)
	public ModelAndView rootProductEnrollmentContentGet(ModelAndView mv, HttpServletRequest h, String productCode){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
//		if(user == null)
//			mv.setViewName("redirect:/");
//		else {
//			if(user.getAuth() == 0) 
//				mv.setViewName("redirect:/");
//			else {
				mv.addObject("enrollment", roots.getEnrollmentString(productCode));
				mv.addObject("product", roots.getProduct(productCode));
				mv.addObject("colorList", roots.getOptionColor(productCode));
				mv.addObject("sizeList", roots.getOptionSize(productCode));
				mv.setViewName("/root/product/enrollmentContent");
//			}
//		}
	    return mv;
	}
	
	@RequestMapping("/enrollment/size")
	@ResponseBody
	public Map<Object, Object> enrollmentSize(@RequestBody OptionVo option){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    ArrayList<OptionVo> list = roots.getOptionSizeColor(option.getProductCode(), option.getColor());
	    ArrayList<String> list2 = new ArrayList<String>();
	    String str1 = " <option value=\"";
	    String str2 = "\">";
	    String str3 = "\"disabled=\"disabled\">";
	    String str4 = "</option>";
	    String str5 = "(품절)</option>";
	    for(OptionVo tmp : list) {
	    	if(tmp.getAmount() == 0)
	    		list2.add(str1 + tmp.getSize() + str3 + tmp.getSize() + str5);
	    	else
	    		list2.add(str1 + tmp.getSize() + str2 + tmp.getSize() + str4);
	    }
	    map.put("option", list2);
	    return map;
	}
	
	@RequestMapping("/enrollment/amount")
	@ResponseBody
	public Map<Object, Object> enrollmentAmount(@RequestBody OptionVo option){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    OptionVo option2 = roots.getOption(option.getProductCode(), option.getSize(), option.getColor());
	    if(option.getPurchase() < option2.getAmount())
	    	map.put("more",true);
	    else
	    	map.put("more",false);
	    return map;
	}
	
	@RequestMapping("/enrollment/finalPrice")
	@ResponseBody
	public Map<Object, Object> enrollmentIncFinalPrice(@RequestBody OptionVo option){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    ProductenrollmentVo enrollment = roots.getEnrollmentString(option.getProductCode());
	    map.put("price",String.format("%,d", enrollment.getFinalPrice() * (option.getPurchase())));
	    return map;
	}
	
	@RequestMapping("/enrollment/color")
	@ResponseBody
	public Map<Object, Object> enrollmentIncDiscount(@RequestBody String code){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    ArrayList<OptionVo> list = roots.getOptionColor(code);
	    ArrayList<String> list2 = new ArrayList<String>();
	    String str1 = "<span style=\"display:inline-block;width:20px;height:20px;background-color:";
	    String str2 = ";border:1px solid black;margin-right:15px;\"></span>";
	    for(OptionVo tmp : list) {
	    	list2.add(str1 + tmp.getColor() + str2);
	    }
	    map.put("color",list2);
	    return map;
	}
}
