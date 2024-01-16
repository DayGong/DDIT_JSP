package kr.or.ddit.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter {

	// 필터 시작. 초기화
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter01 초기화 완료");
		
	}
	
	// 필터 기능 수행
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		// 요청 URI: /ch12/filter01_process.jsp?name=개똥이
		String name = request.getParameter("name");	// 개똥이
		
		// 파라미터가 없다면
		if ( name == null || name.equals("") ) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");	// MIME 타입
			PrintWriter writer = response.getWriter();
			String message = "입력된 name 값은 null입니다.";
			writer.println(message);
			return;
		}
		
		// 필터가 여러개가 있을 때 전달~전달 해줌
		chain.doFilter(request, response);
	}
	
	// 필터가 종료하기 전 호출
	@Override
	public void destroy() {
		System.out.println("Filter01 해제");
	}
	
}
