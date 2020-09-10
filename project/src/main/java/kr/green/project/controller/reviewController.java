package kr.green.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.pagination.ProductCri;
import kr.green.project.service.reviewService;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.PurchaselistVo;
import kr.green.project.vo.UserVo;

@Controller
public class reviewController {
	
	@Autowired
	reviewService res;
	
	private static final Logger logger = LoggerFactory.getLogger(reviewController.class);
	
	@RequestMapping(value= "/review/register", method = RequestMethod.GET)
	public ModelAndView reviewRegisterGet(ModelAndView mv, ProductCri pri, int purchaseNum, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		PurchaseVo purchase = res.getPurchaseTonum(purchaseNum);
		mv.addObject("pri", pri);
		if(purchase.getUserId().equals(user.getId())) {
			ArrayList<PurchaselistVo> list = res.getPurchaselistReview(purchaseNum);
			mv.addObject("list", list);
			mv.setViewName("/review/register");
		}
		else 
			mv.setViewName("redirect:/information/purchaseList");
	    return mv;
	}
	
}
