package kr.green.spring.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.spring.service.UserService;
import kr.green.spring.vo.UserVo;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView homeGet(ModelAndView mv) {
	    mv.setViewName("/main/home");
	    return mv;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ModelAndView homePost(ModelAndView mv, UserVo user) {
		UserVo dbUser = userService.isSignin(user);
		if(dbUser != null) {
			mv.setViewName("redirect:/board/list");
			mv.addObject("user",dbUser);
		}
		else
			mv.setViewName("redirect:/");
	    return mv;
	}
	
	// mailSending 코드
	@RequestMapping(value = "/mail/mailSending")
	public String mailSending(HttpServletRequest request) {

	    String setfrom = "stajun@naver.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String title   = request.getParameter("title");      // 제목
//	    String content = request.getParameter("content");    // 내용
	    
	    String id = request.getParameter("content");
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
	        String format1 = "<h1>야</h1>";
	        String format2 = "<span style=\"color:red\">호</span>";
	        String format3 = "<h1>새로운 비밀번호는</h1><h2>";
	        String format4 = "</h2>입니다.";
	        messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	        messageHelper.setTo(tomail);     // 받는사람 이메일
	        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
//	        messageHelper.setText(format1 + content + format2, true);  // 메일 내용 true = html코드 보내기 가능
	        messageHelper.setText(format3 + newPw + format4, true);

	        mailSender.send(message);
	    } catch(Exception e){
	        System.out.println(e);
	    }

	    return "redirect:/";
	}
	@RequestMapping(value = "/mail", method = RequestMethod.GET)
	public ModelAndView mailGet(ModelAndView mv) {
		mv.setViewName("/main/mail");
	    return mv;
	}
	
	@RequestMapping(value = "/user/lostPw", method = RequestMethod.GET)
	public ModelAndView lostPwGet(ModelAndView mv) {
		mv.setViewName("/user/lostPw");
	    return mv;
	}
}
