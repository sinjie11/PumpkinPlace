package com.error404.pumpkinplace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value ="/jobboard")
public class JobController {

	@RequestMapping(value = "/joblist", method = RequestMethod.GET)
	public void jobList(Model model) {
		// active 설정을 위해 추가
		model.addAttribute("url", "job");
	}
	
	@RequestMapping(value = "/employeelist", method = RequestMethod.GET)
	public void employeeList (Model model) {
		// active 설정을 위해 추가
		model.addAttribute("url", "job");
	}
	
}
