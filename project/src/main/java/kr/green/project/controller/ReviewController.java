package kr.green.project.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.dto.PurchaselistEnrollDto;
import kr.green.project.pagination.ProductCri;
import kr.green.project.service.ReviewService;
import kr.green.project.vo.PurchaseVo;
import kr.green.project.vo.ReviewVo;
import kr.green.project.vo.UserVo;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService res;
	
	@RequestMapping(value= "/review/register", method = RequestMethod.GET)
	public ModelAndView reviewRegisterGet(ModelAndView mv, ProductCri pri, int purchaseNum, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		PurchaseVo purchase = res.getPurchaseTonum(purchaseNum);
		mv.addObject("pri", pri);
		if(purchase.getUserId().equals(user.getId())) {
			ArrayList<PurchaselistEnrollDto> list = res.getPurchaselistReview(purchaseNum);
			mv.addObject("list", list);
			mv.setViewName("/review/register");
		}
		else 
			mv.setViewName("redirect:/information/purchaseList");
	    return mv;
	}
	
	@RequestMapping(value= "/review/register", method = RequestMethod.POST)
	public ModelAndView reviewRegisterPost(ModelAndView mv, HttpServletRequest h, ReviewVo review, int listNum, MultipartFile[] file) throws IOException, Exception{
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		res.insertReview(review, listNum, file, user.getId());
		mv.setViewName("redirect:/information/purchaseList");
	    return mv;
	}
}
