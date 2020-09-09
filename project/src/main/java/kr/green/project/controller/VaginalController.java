package kr.green.project.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.dto.UserVaginalDto;
import kr.green.project.pagination.Criteria;
import kr.green.project.service.VaginalService;
import kr.green.project.vo.AnswerVo;
import kr.green.project.vo.UserVo;
import kr.green.project.vo.VaginalVo;

@Controller
public class VaginalController {

	@Autowired
	VaginalService vagis;
	
	@RequestMapping(value= "/vaginal/list", method = RequestMethod.GET)
	public ModelAndView vaginalListGet(ModelAndView mv, Criteria cri){
		mv.addObject("vaginalList", vagis.getVaginalList(cri));
		mv.addObject("pageMaker", vagis.getPageMaker(cri));
	    mv.setViewName("/vaginal/list");
	    return mv;
	}
	
	@RequestMapping(value= "/vaginal/detail", method = RequestMethod.GET)
	public ModelAndView vaginalDetailGet(ModelAndView mv, int num){
		UserVaginalDto vaginal = vagis.getUserVaginal(num);
		vaginal.setView(vaginal.getView() + 1);
		AnswerVo answer = vagis.getAnswer(num);
		mv.addObject("vaginal", vaginal);
		mv.addObject("vaginalFile", vagis.getVaginalFile(num));
		mv.addObject("answer", answer);
		mv.addObject("answerFile", vagis.getAnswerFile(num));
		vagis.increaseView(num);
	    mv.setViewName("/vaginal/detail");
	    return mv;
	}
	
	@RequestMapping(value= "/vaginal/secret", method = RequestMethod.GET)
	public ModelAndView vaginalSecretGet(ModelAndView mv, int num, HttpServletRequest h){
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		UserVaginalDto vaginal = vagis.getUserVaginal(num);
		AnswerVo answer = vagis.getAnswer(num);
		if(user.getAuth() == 1 || user.getId().equals(vaginal.getUserId())) {
			vaginal.setView(vaginal.getView() + 1);
			mv.addObject("vaginal", vaginal);
			mv.addObject("vaginalFile", vagis.getVaginalFile(num));
			mv.addObject("answer", answer);
			mv.addObject("answerFile", vagis.getAnswerFile(num));
			vagis.increaseView(num);
		    mv.setViewName("/vaginal/secret");
		}
		else
			mv.setViewName("redirect:/vaginal/list");
	    return mv;
	}
	
	@RequestMapping(value= "/vaginal/register", method = RequestMethod.GET)
	public ModelAndView vaginalRegisterGet(ModelAndView mv){
	    mv.setViewName("/vaginal/register");
	    return mv;
	}
	
	@RequestMapping(value= "/vaginal/register", method = RequestMethod.POST)
	public ModelAndView vaginalRegisterPost(ModelAndView mv, VaginalVo vaginal, HttpServletRequest h, MultipartFile[] file) throws IOException, Exception{
		UserVo user = (UserVo)h.getSession().getAttribute("user");
		vagis.insertVaginal(vaginal, h);
		vagis.insertVaginalFile(file, user.getId());
	    mv.setViewName("redirect:/vaginal/list");
	    return mv;
	}
	
	@RequestMapping(value= "/answer/register", method = RequestMethod.POST)
	public ModelAndView answerRegisterPost(ModelAndView mv, AnswerVo answer, MultipartFile[] file) throws IOException, Exception{
		AnswerVo an = vagis.getAnswer(answer.getVaginalNum());
		if(an == null)
			vagis.insertAnswer(answer, file);
	    mv.setViewName("redirect:/vaginal/list");
	    return mv;
	}
}
