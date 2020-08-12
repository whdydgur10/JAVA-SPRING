package kr.green.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.project.service.VaginalService;

@Controller
public class VaginalController {

	@Autowired
	VaginalService vagis;
	
	@RequestMapping(value= "/vaginal/list", method = RequestMethod.GET)
	public ModelAndView vaginalListGet(ModelAndView mv){
		mv.addObject("vaginalList", vagis.getVaginalList());
	    mv.setViewName("/vaginal/list");
	    return mv;
	}
	
	@RequestMapping(value= "/vaginal/detail", method = RequestMethod.GET)
	public ModelAndView vaginalDetailGet(ModelAndView mv, int num){
		mv.addObject("vaginal", vagis.getVaginal(num));
	    mv.setViewName("/vaginal/detail");
	    return mv;
	}
}
