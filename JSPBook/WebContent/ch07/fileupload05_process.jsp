<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%
	/*
	1.form태그 2.post 3.multipart/form-data 4.file
	요청 URI: fileupload05_process.jsp
	요청 파라미터: {name=개똥이,subject=java,filename=파일객체}
	요청 방식: post
	*/
	// 윈도우 경로: 역슬러시 두 개
	String path = "C:\\upload";
	// commons-fileupload.jar 안에 해당 클래스가 있음
	DiskFileUpload upload = new DiskFileUpload();
	// 업로드할 파일의 최대 크기
	upload.setSizeMax(5000000);	// 5Mbyte
	// 메모리에 저장할 최대 크기
	upload.setSizeThreshold(5*4096); // 5 * 1024 * 1024 : 5Mbyte
	// 업로드된 파일을 임시로 저장할 경로
	upload.setRepositoryPath(path);
	
	// 요청 파라미터: {filename=파일객체}
	// parse: 구문분석(오류체크), 의미분석
	List items = upload.parseRequest(request);
	// 요청 파라미터를 Iterator(열거) 클래스로 변환
	Iterator params = items.iterator();
	// 요청 파라미터가 없어질 때까지 반복(1회 반복)
	while(params.hasNext()) {
		// FileItem : 1) 일반데이터 2) 파일
		FileItem item = (FileItem) params.next();
		
		if (item.isFormField()) { // 1) 일반 데이터(input type="text", radio, checkbox, textarea, select)
			// 요청 파라미터: {name=개똥이,subject=java}
			String name = item.getFieldName(); // name, subject
			String value = item.getString("UTF-8");	// 개똥이, java
			out.print(name + " = " + value + "<br />");
		} else { // 2) 파일(input type="file")
			// 요청파라미터: {filename=파일객체} => item
			String fileFiledName = item.getFieldName(); // filename
			String fileName = item.getName();	// 업로드될 파일의 이름
			String contentType = item.getContentType(); // 만약 이미지파일이라면 MIME TYPE: image/jpeg
			long fileSize = item.getSize(); // 파일의 크기
			// fileName => D:\\D_Other\\연습용\\cloud03.jpg
			// 마지막 \\의 위치를 찾아서 +1을 하면 c가 나오는데 거기서부터 끝까지 추출
			fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
			
			// 파일 중복 방지 시작
			// java.util.UUID => 랜덤값 생성
			UUID uuid = UUID.randomUUID();
			// 원래의 파일 이름과 구분하기 위해 _를 붙임(랜덤값_개똥이.jsp)
			fileName = uuid.toString() + "_" + fileName;
			// 파일 중복 방지 끝
			
			// 계획. c:\\upload\\cloud03.jpg로 복사해야 함
			File file = new File(path + "/" + fileName);
			// 복사 실행
			// 파일객체.write(계획)
			item.write(file);
			
			out.print("=========================================<br />");
			out.print("요청 파라미터 이름: " + fileFiledName + "<br />");
			out.print("저장 파일 이름: " + fileName + "<br />");
			out.print("파일 콘텐츠 유형 " + contentType + "<br />");
			out.print("파일 크기: " + fileSize + "<br />");
		}
	}
%>