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
import kr.green.project.service.InformationService;
import kr.green.project.service.ProductService;
import kr.green.project.service.RootService;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductenrollmentVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.UserVo;

@Controller
public class ProductController {

	@Autowired
	ProductService pros;
	@Autowired
	RootService roots;
	@Autowired
	InformationService infos;
	
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
	
	@RequestMapping("/insertPurchase")
	public Map<Object, Object> insertPurchase(HttpServletRequest h){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = (UserVo)h.getSession().getAttribute("user");
	    pros.insertPurchase(user.getId());
	    return map;
	}
	
	@RequestMapping("/insertPurchaseList")
	@ResponseBody
	public Map<Object, Object> insertPurchaseList(@RequestBody PurchaselistVo purchase, HttpServletRequest h){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = (UserVo)h.getSession().getAttribute("user");
	    pros.insertPurchaseList(user.getId(), purchase);
	    return map;
	}
//	jsp와 정보를 주고받을 때는 @~~Body를 이용해야하고 자체적으로 정보를 사용할 때는 없앤다.
	
	@RequestMapping("/insertShoppingBasket")
	@ResponseBody
	public Map<Object, Object> insertShoppingBasket(@RequestBody PurchaselistVo purchase, HttpServletRequest h){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = (UserVo)h.getSession().getAttribute("user");
	    pros.insertShoppingBasket(user.getId(), purchase.getEnrollNum(), purchase.getOptionCode(), purchase.getPurchase());
	    return map;
	}
	
//	@RequestBody는 하나만
	
	@RequestMapping(value= "/product/order", method = RequestMethod.GET)
	public ModelAndView productOrderGet(ModelAndView mv, HttpServletRequest h, ProductCri cri, PurchaseVo purchase){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		mv.addObject("cri", cri);
		if(purchase.getNum() == 0) {
			purchase = pros.getPurchase(user.getId());
			if(!purchase.getUserId().equals(user.getId()))
				mv.setViewName("redirect:/");
			else {
				mv.addObject("purchase", purchase);
				mv.addObject("purchaselist", pros.getPurchaseList(purchase.getNum()));
				mv.setViewName("/product/order");
			}
		}else {
			purchase = pros.getPurchase(purchase.getNum());
			if(!purchase.getUserId().equals(user.getId()))
				mv.setViewName("redirect:/");
			else {
				mv.addObject("purchase", purchase);
				mv.addObject("purchaselist", pros.getPurchaseList(purchase.getNum()));
				mv.setViewName("/product/order");
			}
		}
//		내려줄 정보는 장바구니나 바로 구매를 통해 나온 리스트, 개인 사용가능 쿠폰, 사용가능 포인트, 배송지 정보
	    return mv;
	}
	
	@RequestMapping("/purchasePrice")
	@ResponseBody
	public Map<Object, Object> purchasePrice(@RequestBody int purchaseNum){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    int price = pros.getPurchasePrice(purchaseNum);
	    map.put("price", String.format("%,d", price));
	    return map;
	}
	
	@RequestMapping("/deliveryPrice")
	@ResponseBody
	public Map<Object, Object> deliveryPrice(@RequestBody int purchaseNum){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    int price = pros.getDeliveryPrice(purchaseNum);
	    map.put("price", String.format("%,d", price));
	    return map;
	}
	
	@RequestMapping("/couponCount")
	@ResponseBody
	public Map<Object, Object> couponCount(HttpServletRequest h){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = (UserVo)h.getSession().getAttribute("user");
	    map.put("count", infos.getCouponNum(user.getId()));
	    return map;
	}
	
	@RequestMapping("/pointPercent")
	@ResponseBody
	public Map<Object, Object> pointPercent(HttpServletRequest h){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = (UserVo)h.getSession().getAttribute("user");
	    map.put("point", infos.getPointPercent(user.getId()));
	    return map;
	}
}
