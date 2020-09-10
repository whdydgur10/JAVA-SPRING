package kr.green.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import kr.green.project.service.UserService;
import kr.green.project.utils.Coolsms;
import kr.green.project.vo.UserVo;

@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	@Autowired
	InformationService infos;
	@Autowired
	ProductService pros;
	
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
		if(user != null) {
			UserVo user2 = userService.getUser(user);
			if(user2 != null) {
				mv.addObject("user", user2);
				mv.setViewName("redirect:/");
			}else
				mv.setViewName("redirect:/user/signin");
		}else
			mv.setViewName("redirect:/user/signin");
	    return mv;
	}
	
	@RequestMapping(value= "/user/signout", method = RequestMethod.GET)
	public ModelAndView signoutGet(ModelAndView mv, HttpServletRequest h){
		h.getSession().removeAttribute("user");
	    mv.setViewName("redirect:/");
	    return mv;
	}
	
	
}
