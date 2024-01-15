<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<title>Validation</title>
</head>
<script type="text/javascript">
	function CheckLogin() {
		var form = document.loginForm;
		var dupl = 1;
		var pwArry = new Array(); // passwd의 charAt이 저장될 변수
		
		if (form.id.value == "") {
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return false;
		} 
		
		if (form.passwd.value == "") {
			alert("비밀번호를 입력해주세요.");
			form.passwd.focus();
			return false;
		}
		
		for (i = 0; i < form.passwd.value.length; i++) {
			pwArry[i] = form.passwd.value.charAt(i);
		}
		
		for (i = 0; i < form.passwd.value.length; i++) {
			
			if (pwArry[i] == pwArry[i+1]){
				dupl++;
			} else {
				dupl = 1;
			}
			
			if (dupl >= 3) {
				alert("영문, 숫자는 3자 이상 연속 입력할 수 없습니다.");
				form.passwd.select();
				return;
			}
		}
		
		if (form.passwd.value != form.passwdCheck.value) { 
			alert("비밀번호가 일치하지 않습니다.");
			form.passwdCheck.select();
			return;
		}

		form.submit();
	}
	
	$(function() {
		var form = document.loginForm;
		
		$("input[name='passwdCheck']").on('input', function() {
			if (form.passwd.value != form.passwdCheck.value) { 
				$("#passwd-dupl").text("비밀번호가 일치하지 않습니다.");
				return;
			} else {
				$("#passwd-dupl").text("");
			}
		});
	});
</script>
<body>
	<form name="loginForm">
		<p>아이디: <input type="text" name="id" /></p>
		<p>비밀번호: <input type="text" name="passwd" /></p>
		<p>비밀번호 확인: <input type="text" name="passwdCheck" /></p>
		<span id="passwd-dupl"></span>
		<p><input type="button" value="전송" onclick="CheckLogin()" /></p>
	</form>
</body>
</html>