package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("userID");
		System.out.println("doFilter->username : " + username);
		
		if(username==null) {//로그인 실패
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginForm.jsp");
			dispatcher.forward(request, response);
		}else {//로그인 성공
			RequestDispatcher dispatcher = request.getRequestDispatcher("login_success.jsp");
			dispatcher.forward(request, response);
		}
	}

	@Override
	public void destroy() {
		
	}	
}
