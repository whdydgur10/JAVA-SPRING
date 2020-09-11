package kr.green.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
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

import kr.green.project.pagination.ProductCri;
import kr.green.project.service.InformationService;
import kr.green.project.service.ProductService;
import kr.green.project.service.UserService;
import kr.green.project.utils.Coolsms;
import kr.green.project.vo.OptionVo;
import kr.green.project.vo.UserVo;

@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	@Autowired
	InformationService infos;
	@Autowired
	ProductService pros;
	@Autowired
	private JavaMailSender mailSender;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value= "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv, HttpServletRequest h, ProductCri pri){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		if(user == null) {
			if(pri.getMainCategory().equals(""))
				pri.setMainCategory("MW");
			mv.addObject("pri", pri);
			mv.addObject("list", pros.getProductEnrollmentList(pri));
			mv.addObject("pageMaker", pros.getProductPage(pri));
		}
		else {
			if(pri.getMainCategory().equals(""))
				pri.setMainCategory(user.getGender());
			mv.addObject("pri", pri);
			mv.addObject("list", pros.getProductEnrollmentList(pri));
			mv.addObject("pageMaker", pros.getProductPage(pri));
		}
	    mv.setViewName("/main/home");
	    return mv;
	}

	@RequestMapping(value= "/user/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv){
	    mv.setViewName("/user/signup");
	    return mv;
	}
	
	@RequestMapping(value= "/user/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, UserVo user){
		if(user != null) {
			userService.insertUser(user);
			String code = "X5Q8411";
			infos.insertCoupon(user.getId(), code);
			mv.setViewName("redirect:/");
		}
		else
			mv.setViewName("redirect:/user/signup");
	    return mv;
	}
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("idCheck", userService.isUserId(id));
	    return map;
	}
	
	@RequestMapping("/phoneCheck")
	@ResponseBody
	public HashMap<String, String> phoneCheck(@RequestBody String num, HttpServletRequest request){
	    HashMap<String, String> map = new HashMap<String, String>();
	    String api_key = "NCSN92MJ98KJIBMO"; //위에서 받은 api key를 추가
        String api_secret = "TSXMRSPHFTWOGBJI7JNRIN5OV0DXUTVO";  //위에서 받은 api secret를 추가
        Coolsms coolsms = new Coolsms(api_key, api_secret);
        map.put("to", num); // 수신번호
        
        map.put("from", "01031207739"); // 발신번호, jsp에서 전송한 발신번호를 받아 map에 저장한다.
        String str = "";
        for(int i = 0; i < 4; i++) {
        	int random = (int)(Math.random()*9);
        	str = str + random;
        }
        String text = "본인확인 인증번호(" + str + ")입력시 정상처리 됩니다.";
        map.put("text", text); // 문자내용, jsp에서 전송한 문자내용을 받아 map에 저장한다.
        map.put("num",str);
        map.put("type", "sms"); // 문자 타입

        System.out.println(map);

        JSONObject result = coolsms.send(map); // 보내기&전송결과받기

//        if (result.get("status").equals(true)) {
//
//          // 메시지 보내기 성공 및 전송결과 출력
//          System.out.println("성공");
//          System.out.println(result.get("group_id")); // 그룹아이디
//          System.out.println(result.get("result_code")); // 결과코드
//          System.out.println(result.get("result_message")); // 결과 메시지
//          System.out.println(result.get("success_count")); // 메시지아이디
//          System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
//        } else {
//
//          // 메시지 보내기 실패
//          System.out.println("실패");
//          System.out.println(result.get("code")); // REST API 에러코드
//          System.out.println(result.get("message")); // 에러메시지
//        }

	    return map;
	}
	
	@RequestMapping(value= "/user/signin", method = RequestMethod.GET)
	public ModelAndView signinGet(ModelAndView mv){
	    mv.setViewName("/user/signin");
	    return mv;
	}
	
	@RequestMapping(value= "/user/signin", method = RequestMethod.POST)
	public ModelAndView signinPost(ModelAndView mv, UserVo user){
		UserVo user2 = userService.getUser(user);
		mv.addObject("user", user2);
		mv.setViewName("redirect:/");
	    return mv;
//	    정보를 보내주면서 http서버에 저장시킨다.
	}
	
	@RequestMapping("/signin")
	@ResponseBody
	public Map<Object, Object> signin(@RequestBody UserVo user){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user2 = userService.getUser(user);
	    if(userService.isUserId(user.getId()) == false) 
	    	map.put("id",false);
	    else  if(user2 == null) 
	    	map.put("pw",false);
	    else 
	    	map.put("pw", true);
	    return map;
	}
	
	@RequestMapping("/searchId")
	@ResponseBody
	public Map<Object, Object> searchId(@RequestBody UserVo user){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user2 = userService.getUserTophone(user);
	    
	    if(user2 == null) 
	    	map.put("user",null);
	    else
	    	map.put("user",user2.getId());
	    return map;
	}
	
	@RequestMapping("/searchPw")
	@ResponseBody
	public Map<Object, Object> searchPw(@RequestBody String list){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    UserVo user = userService.getUserToid(list);
	    System.out.println(user);
	    if(user == null)
	    	map.put("id",false);
	    else {
	    	map.put("id",true);
	    	String setfrom = "fassong125@gmail.com";         
		    String tomail  = user.getEmail();     // 받는 사람 이메일
		    String title   = "(주)빠숑 임시 비밀번호 발신";      // 제목
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
		    userService.newPw(list, newPw);
		    //비밀번호 찾기 랜덤비밀번호 보내기
		    try {
		        MimeMessage message = mailSender.createMimeMessage();
		        MimeMessageHelper messageHelper 
		            = new MimeMessageHelper(message, true, "UTF-8");

		        messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		        messageHelper.setTo(tomail);     // 받는사람 이메일
		        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		        messageHelper.setText("임시 비밀번호는"+ newPw + "입니다. 로그인 후 비밀번호를 변경해주세요.",true);  // 메일 내용 true html태그 사용할때 필요

		        mailSender.send(message);
		    } catch(Exception e){
		        System.out.println(e);
		    }
	    }
	    return map;
	}
	
	@RequestMapping(value= "/user/signout", method = RequestMethod.GET)
	public ModelAndView signoutGet(ModelAndView mv, HttpServletRequest h){
		h.getSession().removeAttribute("user");
	    mv.setViewName("redirect:/");
	    return mv;
	}
	
	
}
