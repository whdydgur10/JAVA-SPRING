package kr.green.last.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.last.service.UserService;
import kr.green.last.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	private JavaMailSender mailSender;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/user/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv) {
		mv.setViewName("/user/signup");
		return mv;
	}
	
	@RequestMapping(value = "/user/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, UserVo user) {
		if(userService.getUser(user) != null || user == null)
			mv.setViewName("redirect:/user/signup");
		else {
			userService.insertUser(user);
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	@RequestMapping(value ="/idCheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("idCheck",(userService.isUser(id) == false));
	    return map;
	}
	
	@RequestMapping(value = "/user/signin", method = RequestMethod.GET)
	public ModelAndView signinGet(ModelAndView mv) {
		mv.setViewName("/user/signin");
		return mv;
	}
	
	@RequestMapping(value = "/user/signin", method = RequestMethod.POST)
	public ModelAndView signinPost(ModelAndView mv, UserVo user) {
		UserVo dbUser = userService.login(user);
		if( dbUser != null) {
			mv.addObject("user",dbUser);
			mv.setViewName("redirect:/");
		}else
			mv.setViewName("redirect:/user/signin");
		return mv;
	}
	
	@RequestMapping(value = "/user/signout", method = RequestMethod.GET)
	public ModelAndView signoutGet(ModelAndView mv, HttpServletRequest r) {
		r.getSession().removeAttribute("user");
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping(value = "/user/lostid", method = RequestMethod.GET)
	public ModelAndView lostidGet(ModelAndView mv) {
		mv.setViewName("/user/lostid");
		return mv;
	}
	
	@RequestMapping(value ="/getId")
	@ResponseBody
	public Map<Object, Object> getId(@RequestBody String email){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("getId",(userService.getId(email) != null));
	    map.put("id",userService.getId(email));
	    return map;
	}
	
	@RequestMapping(value = "/user/lostpw", method = RequestMethod.GET)
	public ModelAndView lostpwGet(ModelAndView mv) {
		mv.setViewName("/user/lostpw");
		return mv;
	}
	
	// mailSending 코드
		@RequestMapping(value = "/mail/lostpw")
		public String mailSending(HttpServletRequest request, String id) {

		    String setfrom = "last";         
		    String tomail  = userService.getEmail(id);     // 받는 사람 이메일
		    int ran = 13;
		    String newPw = "";
		    for(int i = 0; i < ran; i++) {
		    	int r = (int)(Math.random() * 62);
		    	char ch;
		    	if(r <= 9) {
		    		ch = (char)('0'+r);
		    	}else if(r <= 35) {
		    		ch = (char)('a'+(r-10));
		    	}else {
		    		ch = (char)('A'+(r-36));
		    	}
		    	newPw += ch;
		    }
		    userService.newPw(id, newPw);
		    //비밀번호 찾기 랜덤비밀번호 보내기

		    try {
		        MimeMessage message = mailSender.createMimeMessage();
		        MimeMessageHelper messageHelper 
		            = new MimeMessageHelper(message, true, "UTF-8");
		        String format3 = "<h1>새로운 비밀번호는</h1><h2>";
		        String format4 = "</h2>입니다.";
		        messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		        messageHelper.setTo(tomail);     // 받는사람 이메일
		        messageHelper.setText(format3 + newPw + format4, true);//true이면 html코드 가능

		        mailSender.send(message);
		    } catch(Exception e){
		        System.out.println(e);
		    }

		    return "redirect:/user/signin";
		}

}