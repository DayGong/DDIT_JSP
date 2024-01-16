<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript">
	function checkform() {
		let form = document.loginForm;
		
		// 아이디는 영문 소문자만 가능
		// form.id.value : admin
		for ( i = 0; i < form.id.value.length; i++ ) {
			let ch = form.id.value.charAt(i);
			
			if ( (ch < 'a' || ch > 'z') && 
					(ch > 'A' || ch < 'Z') && (ch > '0' || ch < '9') ) {
				alert("아이디는 영문 소문자만 입력 가능합니다");
				form.id.select();
				return;		// break는 for문을 멈추는 반면, return은 함수 자체를 끝냄
			}
		} 
		
		// 비밀번호는 숫자만 입력 가능
		if ( isNaN(form.passwd.value) ) {
			alert("비밀번호는 숫자만 입력 가능합니다");
			form.passwd.select();
			return;
		}
		
		// 위의 분기문을 잘 통과하면
		form.submit();				// URL 요청
	}
</script>
</head>
<body>
	<!-- 
	요청URI : validation02_process.jsp
	요청파라미터 : {id=a001,passwd=java}
	요청방식 : post
    -->
	<form name="loginForm" action="validation02_process.jsp" method="post">
		<p>아이디: <input type="text" name="id" required /></p>
		<p>비밀번호: <input type="password" name="passwd" required /></p>
		<!-- checkform() : 핸들러 함수 -->
		<p><input type="button" value="전송" onclick="checkform()" /></p>
	</form>
</body>
</html>