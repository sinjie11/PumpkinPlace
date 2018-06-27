package com.error404.pumpkinplace.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.error404.pumpkinplace.domain.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("preHandle() 호출");
		
		// 기존에 loginId 정보가 세션에 남아 있다면 제거
		HttpSession session = request.getSession();
		Object loginId = session.getAttribute("loginId");
		if (loginId != null) {
			session.removeAttribute("loginId");
		}
		
		return true;
	}  // end preHandle()
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info("postHandle() 호출");
		
		// 컨트롤러 메소드에서 Model에 저장한 loginResult의 null 여부를 체크
		Map<String, Object> model = modelAndView.getModel();
		
		Member m = (Member) model.get("loginResult");
		
		String targetUrl = request.getParameter("targetUrl");
		
		if (m != null) { // 로그인 성공,  null이 아니면 targetUrl로 리다이렉트
			request.getSession().setAttribute("loginId", m.getMem_id());
			request.getSession().setAttribute("loginPwd", m.getMem_pwd());
			request.getSession().setAttribute("loginEmail", m.getMem_email());
			request.getSession().setAttribute("loginPwd", m.getMem_tel());
			request.getSession().setAttribute("loginPwd", m.getMem_regdate());
			
			if (targetUrl != null && !targetUrl.equals("")) {
				response.sendRedirect(targetUrl);
				
			} else {
				response.sendRedirect("/pumpkinplace");
			}
			
		} else { // 로그인 실패, null이면 login으로 리다이렉트
			response.sendRedirect("/pumpkinplace/member/login?target=" + targetUrl);
			logger.info("로그인 실패!!!");
		}		
		
	} // end postHandle()
	

} // end class LoginInterceptor
