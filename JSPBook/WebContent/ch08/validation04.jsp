<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script type="text/javascript">
	// 핸들러함수
	function checkform() {
		// 이름은 숫자로 시작할 수 없음
		// "1admin".substr(0,1) => 1
		// isNan: It is Not a Number: 숫자가 아니다. => ! => 숫자다
		if( !isNaN(document.frm.name.value.substr(0,1)) ) {
			// 숫자라면
			alert("이름은 숫자로 시작할 수 없습니다");
			document.frm.name.select();
			return;
		}
		
		// 위의 분기문을 잘 통과하면
		// form에 action 속성이 없으면? 현재 URL을 요청
		// method 속성이 없으면? 기본 get 방식
		document.frm.submit();				// URL 요청
	}
</script>
</head>
<body>
	<!-- 
	요청URI : validation04.jsp?name=admin
	요청파라미터 : name=admin
	요청방식 : get
    -->
    <!-- 게시판 검색할 때 주로 사용 -->
	<form name="frm">
		<p>이름: <input type="text" name="name" required /></p>
		<p><input type="button" value="전송" onclick="checkform()" /></p>
	</form>
</body>
</html>