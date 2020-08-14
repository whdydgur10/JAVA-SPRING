package kr.green.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.green.project.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService pros;
	
	
	
	
}
