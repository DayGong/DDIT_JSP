<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<title>Form Processing</title>
<script type="text/javascript">
// document 내의 요소들이 모두 로딩된 후에 실행
$(function(){
	$("#phone1").append("<option value='010'>010</option>");
	$("#phone1").append("<option value='011'>011</option>");
	$("#phone1").append("<option value='016'>016</option>");
	$("#phone1").append("<option value='017'>017</option>");
	$("#phone1").append("<option value='019'>019</option>");
});
</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="/ch06/form01_process.jsp" name="member" method="post">
		<p>
			아이디 : <input type="text" name="id" required/> 
					<input type="button" value="아이디 중복 검사" />
		</p>
		<p>
			비밀번호 : <input type="password" name="passwd" required/>
		</p>
		<p>
			이름 : <input type="text" name="name" required/>
		</p>
		<p>
			연락처 : 
			<select id="phone1" name="phone1">
			
			</select>
			- <input type="text" maxlength="4" size="4" name="phone2" /> 
			- <input type="text" maxlength="4" size="4" name="phone3" />
		</p>
		<p>
			성별 : <input type="radio" name="gender" value="남성" checked />남성 
				<input type="radio" name="gender" value="여성" />여성
		</p>
		<p>
			취미 : 독서<input type="checkbox" name="hobby" value="독서" checked /> 
			운동	<input type="checkbox" name="hobby" value="운동"/> 
			영화	<input type="checkbox" name="hobby" value="영화"/>
		</p>
		<p>
			<!-- p.190 -->
			<!-- size속성 : 해당 개수대로 미리 보여줌 -->
			<select name="city" size="3">
				<option value="대전광역시">대전광역시</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="인천">인천</option>
				<option value="충청">충청</option>
				<option value="전라">전라</option>
				<option value="경상">경상</option>
			</select>
		</p>
		<p>
			<select name="food">
				<optgroup label="분식류">
					<option value="ddeukboki">떡볶이</option>
					<option value="sundai">순대</option>
				</optgroup>
				<optgroup label="안주류">
					<option value="oddolpyeo">오돌뼈</option>
					<option value="odaengtang">오뎅탕</option>
				</optgroup>
				<optgroup label="찌개류">
					<option value="kmichijjigae">김치찌개</option>
					<option value="doinjangjjigae">된장찌개</option>
				</optgroup>
			</select>
		</p>
		<p>
			<input type="submit" value="가입하기" /> 
			<input type="reset"	value="다시 쓰기" />
		</p>
	</form>
</body>
</html>