package com.error404.pumpkinplace.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Object loginId = request.getSession().getAttribute("loginId");
		if (loginId != null) { // 로그인 상태, 원래 실행하려고 했던 컨트롤러 메소드를 실행 - > return true;
			return true;
			
		} else { // 로그아웃 상태 , login(GET) 페이지로 이동(redirect) -> return false;
			String url = getTargetUrl(request);
			logger.info("url: {}", url);
			
			response.sendRedirect(url);
			
			return false;
		}
		
	} // end preHandle()

	private String getTargetUrl(HttpServletRequest request) {
		// http://서버주소:포트번호/ContextRoot/주소?query=...
		String url = request.getRequestURI().toString();
		
		String queryString = request.getQueryString();
		
		if (queryString == null) {
			queryString = "target=" + url;
			
		} else {
			queryString += "&target=" + url;
		}
		
		return "/pumpkinplace/member/login?" + queryString;
	
	} // end getTargetUrl(request)
	

} // end class AuthInterceptor
