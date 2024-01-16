package kr.or.ddit.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitParamFilter implements Filter {
	private FilterConfig filterConfig = null;
	
	// 필터 시작. 초기화
	// web.xml{param1=admin,param2=java}
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02 초기화");
		this.filterConfig = filterConfig;
	}

	// 필터 기능 수행
	/*
	요청URI : filter02_process.jsp
	요청파라미터 : {id=admin,passwd=java}
	요청방식 : post
	*/
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter02 수행");
		String id 		= request.getParameter("id");		// admin
		String passwd 	= request.getParameter("passwd");	// java
		
		// web.xml 필터 파라미터 값
		// web.xml{param1=admin,param2=java}
		String param1 = this.filterConfig.getInitParameter("param1");	// admin
		String param2 = this.filterConfig.getInitParameter("param2");	// java
		
		String message;
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");	// MIME 타입
		
		PrintWriter writer = response.getWriter();
		
		if ( id.equals(param1) && passwd.equals(param2) ) {
			message = "로그인 성공!";
		} else {
			message = "로그인 실패!";
		}
		// message 변수의 값이 response객체에 들어감
		writer.println(message);
		
		// 다음 필터로 전달
		chain.doFilter(request, response);
	}

	// 필터가 종료하기 전 호출
	@Override
	public void destroy() {
		System.out.println("Filter02 해제");
	}

}
