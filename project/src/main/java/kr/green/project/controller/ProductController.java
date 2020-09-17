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
import kr.green.project.service.ReviewService;
import kr.green.project.service.RootService;
import kr.green.project.vo.AddressVo;
import kr.green.project.vo.CouponVo;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.ProductenrollmentVo;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.RefundVo;
import kr.green.project.vo.UserVo;

@Controller
public class ProductController {

	@Autowired
	ProductService pros;
	@Autowired
	RootService roots;
	@Autowired
	InformationService infos;
	@Autowired
	ReviewService res;
	
	@RequestMapping(value= "/product/detail", method = RequestMethod.GET)
	public ModelAndView productDtailGet(ModelAndView mv, String productCode, ProductCri pri){
		ProductenrollmentVo enrollment = roots.getEnrollmentString(productCode);
		mv.addObject("pri", pri);
		mv.addObject("enrollment", enrollment);
		mv.addObject("product", roots.getProduct(productCode));
		mv.addObject("colorList", roots.getOptionColor(productCode));
		mv.addObject("sizeList", pros.getContentSize(enrollment.getNum()));
		mv.addObject("remark", pros.getContentRemark(enrollment.getNum()));
		mv.addObject("sizeText", pros.getContentSizeText(enrollment.getNum()));
		mv.addObject("thumbnail", pros.getThumbnailImage(enrollment.getNum()));
		mv.addObject("image", pros.getContentImage(enrollment.getNum()));
		mv.addObject("review", res.getReview(enrollment.getNum(),pri));
		mv.addObject("pageMaker", res.getProductPage(pri, enrollment.getNum()));
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
	public Map<Object, Object> insertPurchaseList(@RequestBody PurchaselistVo purchase, HttpServletRequest h){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = (UserVo)h.getSession().getAttribute("user");
	    pros.insertPurchaseList(user.getId(), purchase);
	    return map;
	}
//	jsp와 정보를 주고받을 때는 @~~Body를 이용해야하고 자체적으로 정보를 사용할 때는 없앤다.
	
	@RequestMapping("/insertShoppingBasket")
	public Map<Object, Object> insertShoppingBasket(@RequestBody PurchaselistVo purchase, HttpServletRequest h){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = (UserVo)h.getSession().getAttribute("user");
	    pros.insertShoppingBasket(user.getId(), purchase.getEnrollNum(), purchase.getOptionCode(), purchase.getPurchase());
	    return map;
	}
	
//	@RequestBody는 하나만
	
	@RequestMapping(value= "/product/order", method = RequestMethod.GET)
	public ModelAndView productOrderGet(ModelAndView mv, HttpServletRequest h, ProductCri pri, PurchaseVo purchase){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		mv.addObject("pri", pri);
		if(purchase.getNum() == 0) {
			purchase = pros.getPurchase(user.getId());
			if(!purchase.getUserId().equals(user.getId()) || purchase.getIsDel() == 'Y')
				mv.setViewName("redirect:/");
			else {
				mv.addObject("purchase", purchase);
				mv.addObject("purchaselist", pros.getPurchaseList(purchase.getNum()));
				mv.addObject("couponlist", infos.getCouponList(user.getId()));
				mv.addObject("addresslist", infos.getaddressList(h));
				mv.setViewName("/product/order");
			}
		}else {
			purchase = pros.getPurchase(purchase.getNum());
			if(!purchase.getUserId().equals(user.getId()) || purchase.getIsDel() == 'Y')
				mv.setViewName("redirect:/");
			else {
				mv.addObject("purchase", purchase);
				mv.addObject("purchaselist", pros.getPurchaseList(purchase.getNum()));
				mv.addObject("couponlist", infos.getCouponList(user.getId()));
				mv.addObject("addresslist", infos.getaddressList(h));
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
	
	@RequestMapping("/address")
	@ResponseBody
	public Map<Object, Object> address(@RequestBody AddressVo address, HttpServletRequest h){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = (UserVo)h.getSession().getAttribute("user");
	    address.setIsTemp('Y');
	    address.setIsMain('N');
	    infos.insertAddress(user, address);
	    map.put("addressNum",infos.getAddressNum(user.getId()));
	    return map;
	}
	
	@RequestMapping("/purchase/coupon")
	@ResponseBody
	public Map<Object, Object> purchaseCoupon(@RequestBody PurchaseVo purchase){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    purchase.setIsPoint('N');
	    pros.updatePurchase(purchase);
	    return map;
	}
	
	@RequestMapping("/purchase/useCoupon")
	@ResponseBody
	public Map<Object, Object> purchaseUseCoupon(@RequestBody CouponVo coupon){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    infos.updateCoupon(coupon);
	    return map;
	}
	
	@RequestMapping("/purchase/point")
	@ResponseBody
	public Map<Object, Object> purchasePoint(@RequestBody PurchaseVo purchase, HttpServletRequest h){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = (UserVo)h.getSession().getAttribute("user");
	    purchase.setIsCoupon('N');
	    pros.updatePurchase(purchase);
	    user.setPoint(user.getPoint() - purchase.getUsePoint());
	    infos.updateDecUserPoint(user);
	    return map;
	}
	@ResponseBody
	@RequestMapping("/purchase")
	public Map<Object, Object> purchase(@RequestBody PurchaseVo purchase){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    purchase.setIsCoupon('N');
	    purchase.setIsPoint('N');
	    pros.updatePurchase(purchase);
	    return map;
	}
	
	@RequestMapping(value= "/product/return", method = RequestMethod.GET)
	public ModelAndView productReturnGet(ModelAndView mv, ProductCri pri, int purchaseNum, HttpServletRequest h){
		mv.addObject("pri", pri);
		mv.setViewName("/product/return");
	    return mv;
	}
	
	@RequestMapping(value= "/product/cancel", method = RequestMethod.GET)
	public ModelAndView productCancelGet(ModelAndView mv, ProductCri pri, int purchaseNum, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		PurchaseVo purchase = res.getPurchaseTonum(purchaseNum);
		mv.addObject("pri", pri);
		if(purchase.getUserId().equals(user.getId())) {
			mv.addObject("purchase", purchase);
			mv.addObject("purchaselist", pros.getPurchaseList(purchase.getNum()));
			mv.setViewName("/product/cancel");
		}
		else 
			mv.setViewName("redirect:/information/purchaseList");
	    return mv;
	}
	
	@RequestMapping(value= "/product/cancel", method = RequestMethod.POST)
	public ModelAndView productCancelPost(ModelAndView mv, RefundVo refund){
		pros.insertRefund(refund);
		mv.setViewName("redirect:/information/purchaseList");
	    return mv;
	}
}
