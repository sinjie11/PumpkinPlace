package com.error404.pumpkinplace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value ="/qnaboard")
public class QnaController {

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) {
		// active 설정을 위해 추가
		model.addAttribute("url", "qna");
	}
}
