<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<title>FileUpload</title>
<script>
// document 내의 모든 요소들이 로딩된 후 실행
$(function(){
	// 이미지 명 보이기 시작
	$("#uploadFile").on("change", handleImg);
	// e : onchange 이벤트
	function handleImg(e) {
		// e.target : <input type="file" id="uploadFile" name="filename" />
		let files = e.target.files;//파일들
		// fileArr = [a.jpg,b.jpg,c.jpg]
		let fileArr = Array.prototype.slice.call(files);
		fileArr.forEach(function(f){			
			console.log(f.name);
			$(".custom-file-label").html(f.name);
		});		
	}
		/* let files = e.target.files;
		
		let fileArr = Array.prototype.slice.call(files);
		
		// f는 파일
		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다.");
				return;	// 함수 종료
			}		
			// 이미지가 맞다면
			// 이미지 이름 띄우기
			let fileName = f.name;
			// 요소.append: 누적, 요소.html: 새로고침, 요소.innerHTML: JavaScript에서 새로고침
			$("#uploadFileText").html(fileName);
			
			// 이미지 미리보기
			let reader = new FileReader();
			// e: reader가 이미지 객체를 읽는 이벤트
			reader.onload = function(e) {
				let img_html = "<img src='" + e.target.result + "' style='width: 100%;' />"
				// 요소.append: 누적, 요소.html: 새로고침, 요소.innerHTML: JavaScript에서 새로고침
				$("#pImg").html(img_html);
			}
			reader.readAsDataURL(f);
		}); 
	}*/
});
</script>
</head>
<body>
	<div class="card card-primary">
		<div class="card-header">
			<h3 class="card-title">로그인</h3>
		</div>
		<!-- 
		요청URI: fileupload06_process.jsp
		요청파라미터: {memMail=text@test.com, password=java, uploadFile=파일객체, remember-me=on}
		요청방식: post
		-->
		<form name="frm" action="fileupload06_process.jsp" method="post"
			enctype="multipart/form-data">
			<div class="card-body">
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label>
					<input type="email" class="form-control" id="memMail" 
						name="memMail" placeholder="Enter email" required/>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<input type="password" class="form-control" id="password" 
						name="password" placeholder="Password" required/>
				</div>
				<div class="form-group">
					<label for="exampleInputFile">File input</label>
					<div class="input-group">
						<div class="custom-file">
							<input type="file" class="custom-file-input" 
								id="uploadFile" name="uploadFile" /> 
							<label class="custom-file-label" for="uploadFile">Choose file</label>
						</div>
					</div>
					<div id="pImg"></div>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="remember-me"
						name="remember-me" />
					<label class="form-check-label" for="remember-me">Check me out</label>
				</div>
			</div>

			<div class="card-footer">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
	</div>
</body>
</html>