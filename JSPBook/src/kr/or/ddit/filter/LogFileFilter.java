package kr.or.ddit.filter;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter {
	// 파일로 만들어야 하므로 파일 객체를 전역 변수 형태로 선언
	PrintWriter writer;
	
	// 필터 시작. 초기화
	// web.xml{filename=c:\\logs\\webmarket.log}
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String filename = filterConfig.getInitParameter("filename");
		
		// 로그를 파일로 저장하기 위해 초기화 작업 수행
		try {
			//FileWriter(String fileName, boolean true/false)
			//1) true : 기존 내용에 새로운 내용이 추가(append)
			//2) false : 기존 내용을 지우고 덮어쓰기(overwrite)
			//PrintWriter(출력대상, boolean true/false)
			//1) true : Auto flush -> writer.flush()를 생략함
			//2) false : Auto flush 안함
			writer = new PrintWriter(new FileWriter(filename, true), true);
			
			// webmarket.log 파일이 없으면 자동 생성
			File file = new File(filename);
			
			if (!file.exists()) {	// 설계상의 파일이 실제 없으면
				// 설계대로 파일을 생성
				file.createNewFile();
				
				writer.println(file.getAbsolutePath() + " 파일이 생성되었습니다.");
			} else {	// 이미 있으면
				System.out.println(file.getAbsolutePath() + "파일이 생성되어 있습니다.");
			}
			
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		writer.println("접속한 클라이언트 IP : " + request.getRemoteAddr());

		// 시스템 현재 시간(시작 시간)
		long start = System.currentTimeMillis();
		writer.println("접근한 URL 경로 : " + getURLPath(request));
		writer.println("요청 처리 시작 시각 : " + getCurrentTime());
		
		// 필터가 연속적으로 있다면 다음 필터로 제어 및 요청/응답 정보를 넘겨줌
		chain.doFilter(request, response);
		
		// 시스템 현재 시간(종료 시간)
		long end = System.currentTimeMillis();
		writer.println("요청 처리 종료 시각 : " + getCurrentTime());
		writer.println("요청 처리 소요 시각 : " + (end - start) + "ms");	// 1000분의 1초 단위
		writer.println("============================");
	}

	@Override
	public void destroy() {
		writer.close();
	}

	// http://localhost/ch03/readParameterNoErrorPage.jsp?name=개똥이
	private String getURLPath(ServletRequest requst) {
		// HttpServletRequest 는 ServletRequest 를 상속
		HttpServletRequest req;
		// currentPath : URL경로 => http://localhost/ch03/readParameterNoErrorPage.jsp
		String currentPath = "";
		// queryString : 요청파라미터 => name=개똥이
		String queryString = "";
		// instanceOf 연산자는 객체가 어떤 클래스인지, 어떤 클래스를 상속받았는지 확인하는데 사용하는 연산자입니다
		if (requst instanceof HttpServletRequest) {
			req = (HttpServletRequest) requst;
			currentPath = req.getRequestURI();// http://localhost/ch03/readParameterNoErrorPage.jsp
			System.out.println("currentPath : " + currentPath);
			queryString = req.getQueryString(); // name=개똥이
			System.out.println("queryString : " + queryString);
			queryString = queryString == null ? "" : "?" + queryString; // ?name=개똥이
		}
		// http://localhost/ch03/readParameterNoErrorPage.jsp?name=개똥이
		return currentPath + queryString;
	}// end getURLPath()

	// 현재 시간을 얻어오는 메소드
	private String getCurrentTime() {
		// 2022/07/11 10:35:12
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		// 캘린더 객체 생성(싱글톤:메모리에 1번 생성하고 전역변수처럼 사용할 수 있음)
		Calendar calendar = Calendar.getInstance();
		// 톰캣서버에서 제공해주는 시스템 현재 시간을 구해서 캘린더 객체에 세팅
		calendar.setTimeInMillis(System.currentTimeMillis());
		// 2022/07/11 10:35:12 이러한 포맷을 준수하면서 리턴
		return formatter.format(calendar.getTime());
	}
}
