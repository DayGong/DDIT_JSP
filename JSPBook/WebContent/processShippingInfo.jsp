<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	/* 
	요청URI : processShippingInfo.jsp
	요청파라미터 : {cartId=SADKFSADDFSALK,name=개똥이,shippingDate=2024/01/12
				,country=대한민국,zipCode=12345,addressName=대전광역시 중구 문화동 123}
	요청방식 : post
	*/
	// 쿠키 쿠키 뉴~ 쿠키. 리스폰스 에드 쿠키. 네임 벨류.
	// 요청 파라미터 정보를 쿠키에 넣음
	Enumeration en = request.getParameterNames();
	Cookie[] cookies = new Cookie[6];
	int cnt = 0;
	
	// 파라미터 개수만큼 반복
	while(en.hasMoreElements()) {
		String paramName = (String) en.nextElement();
		
		/*
		paramName : cartId
		paramName : name
		paramName : shippingDate
		paramName : country
		paramName : zipCode
		paramName : addressName
		*/
		out.print("<p>paramName : " + paramName + "</p>");
		// Shipping_cartId, Shipping_name, ...
		cookies[cnt] = new Cookie("Shipping_" + paramName, 
				URLEncoder.encode(request.getParameter(paramName), "UTF-8")
				);
		cookies[cnt].setMaxAge(24 * 60 * 60);	// 초단위 => 24시간 유지됨
				
		response.addCookie(cookies[cnt]);
		cnt++; 
	}
	
	out.print("<p>-----------------------</p>");
	response.sendRedirect("orderConfirmation.jsp");
%>