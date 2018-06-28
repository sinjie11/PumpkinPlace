package com.error404.pumpkinplace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value ="/jobboard")
public class JobController {

	@RequestMapping(value = "/joblist", method = RequestMethod.GET)
	public void list( ) {
		
	}
}
