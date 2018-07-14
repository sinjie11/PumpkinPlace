package com.error404.pumpkinplace.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.error404.pumpkinplace.domain.Member;
import com.error404.pumpkinplace.service.MemberService;


@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@Autowired
	private MemberService memberService;	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void register() {
		logger.info("register() GET 호출");
		
	} // end register()

	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Member member, RedirectAttributes attr) { // 회원가입
		logger.info("register(mem_id: {}, mem_pwd: {}, mem_email: {}, mem_tel: {})",
				member.getMem_id(), member.getMem_pwd(), member.getMem_email(), member.getMem_tel());
		
		int result = memberService.create(member);
		if (result == 1) { // 회원 가입 성공
			attr.addFlashAttribute("registerResult", "success");
		}
		
		return "redirect:/";
	} // end register(member)
	
	
	@RequestMapping(value = "/checkMemid", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Boolean>checkUserid(String mem_id) { // 아이디 중복 검사
		logger.info("checkMemid(Mem_id: {})", mem_id);
		
		Member m = memberService.read(mem_id);
		
		Boolean result = null;
		if (m == null) {
			result = true; // 사용할 수 있는 아이디
		} else {
			result = false; // 사용할 수 없는 아이디
		}
		
		ResponseEntity<Boolean> entity =
				new ResponseEntity<Boolean>(result, HttpStatus.OK);
		
		return entity;
	} // end checkUserid()
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET) // 로그인
	public void login(HttpServletRequest request, String target, Model model) {
		logger.info("login(target: {}) 호출", target);
		logger.info(request.getParameter("urlNo"));
		
		model.addAttribute("targetUrl", target);
		model.addAttribute("urlNo", request.getParameter("urlNo"));
		
	} // end login(target)
	
	
	@RequestMapping(value = "/login-post", method = RequestMethod.POST) // 로그인(null 여부 체크)
	public void login(Member member, Model model) {
		logger.info("login(mem_id: {}, mem_pwd: {}, urlNo: {}) 호출", member.getMem_id(), member.getMem_pwd());
		
		Member loginResult = memberService.read(member);
		
		// loginResult Null 체크 여부 확인
		// null이 아니면 session에 로그인 정보 저장, target으로 redirect
		// -> 컨트롤러에서 직접 담당하지 않고, LoginInterceptor에서 담당.
		model.addAttribute("loginResult", loginResult);
//		model.addAttribute("", );
		
	} // end login(member)
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET) // 로그 아웃
	public String logout(HttpSession session) {
		logger.info("logout() 호출");
		
		session.removeAttribute("loginId");
		
		// 해당 문장은 꼭 사용해야 로그아웃이 가능함
		session.invalidate();
		
		return "redirect:/"; // 수정
	} // end logout()
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public void profile(HttpSession session, Model model) {

		logger.info("profile() 호출");
				
		Member m = memberService.read((String) session.getAttribute("loginId"));
		
		model.addAttribute("member", m);

	} // end profile()
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void update(String mem_id, Model model) {
		logger.info("update(mem_id: {})", mem_id);
		
		Member m = memberService.read(mem_id);
		
		model.addAttribute("member", m);
	
	} // end update(mem_id, model)
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Member member, RedirectAttributes attr) {
		logger.info("update(member: {})", member);
		
		// RedirectAttributes: redirect 방식에서 View(JSP)에게 데이터를 전달할 때 사용하는 객체
		// redirectAttributes.addFlashAttribute(이름, 값);
		int result = memberService.update(member);
		if (result == 1) {
			attr.addFlashAttribute("result", "s");
			
		}		
		
		return "redirect:profile?mem_id=" + member.getMem_id();
		
	} // end update(member,attr)


	
} // end class MemberController
