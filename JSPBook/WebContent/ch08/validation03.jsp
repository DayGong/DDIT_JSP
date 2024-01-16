<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript">
	function checkform() {
		let form = document.loginForm;
		// 아이디: 4~12자 이내로 입력
		if(form.id.value.length < 4 || form.id.value.length > 12) {
			alert("아이디: 4~12자 이내로 입력해주세요");
			form.id.select();	// 그 요소의 글자를 선택
								// focus()는 커서가 위치하는 것
			return;				// 함수 종료
		}
		
		// 비밀번호: 4자 이상으로 입력
		if(form.passwd.value.length < 4) {
			alert("비밀번호: 4자 이상으로 입력해주세요");
			form.passwd.select();	// 그 요소의 글자를 선택
			return;
		}
		
		// 위의 분기문을 잘 통과하면
		form.submit();				// URL 요청
	}
</script>
</head>
<body>
	<!-- 
	요청URI : validation03_process.jsp
	요청파라미터 : {id=a001,passwd=java}
	요청방식 : post
    -->
	<form name="loginForm" action="validation03_process.jsp" method="post">
		<p>아이디: <input type="text" name="id" required /></p>
		<p>비밀번호: <input type="password" name="passwd" required /></p>
		<!-- checkform() : 핸들러 함수 -->
		<p><input type="button" value="전송" onclick="checkform()" /></p>
	</form>
</body>
</html>