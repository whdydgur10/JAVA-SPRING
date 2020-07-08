package kr.green.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.spring.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private UserService userService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Model model) {
//		logger.info("URI : /");
//		return "home";
//	}
//	@RequestMapping(value = "/test", method = RequestMethod.GET)
//	public String testGet() {
//		logger.info("URI : /test");
//		return "test";
//	}
	@RequestMapping(value = "/naver", method = RequestMethod.GET)
	public String naverGet() {
		logger.info("URI : /naver");
		return "naver";
	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		logger.info("URI : /");
	    mv.setViewName("/main/home");
	    mv.addObject("setHeader", "타일즈");
	    return mv;
	}
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView testGet(ModelAndView mv, String id, String pw) {
		logger.info("URI : /test");
		mv.setViewName("/main/test");
		mv.addObject("title", "테스트");
		logger.info("전송된 아이디 : " + id + " 전송된 비밀번호 : " + pw);
		String userPw = userService.getPw(id);
		logger.info("조회된 비밀번호 : " + userPw);
		int cntUser = userService.getCnt();
		logger.info("조회된 회원수 : " + cntUser);
		
		return mv;
	}

}
