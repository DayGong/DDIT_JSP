<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/ckeditor5/sample/css/sample.css">
<script type="text/javascript" src="/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<title></title>
</head>
<body>
<form name="frm" action="/ch06/form02_process.jsp" method="post">
   <div class="col-md-6">
      <div class="card card-primary">
         <div class="card-header">
            <h3 class="card-title">General</h3>
            <div class="card-tools">
               <button type="button" class="btn btn-tool"
                  data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
               </button>
            </div>
         </div>
         <div class="card-body">
            <div class="form-group">
               <label for="inputName">Project Name</label> 
               <input type="text" id="inputName" name="inputName" class="form-control" required>
            </div>
            <div class="form-group">
               <label for="inputDescription">Project Description</label>
               <div id="divDescription">
               </div>
               <textarea id="inputDescription" name="inputDescription" class="form-control" rows="4"
               		style="display:none;"></textarea>
            </div>
            <div class="form-group">
               <label for="inputStatus">Status</label> 
               <select id="inputStatus" name="inputStatus" class="form-control custom-select">
                  <option selected="" disabled="">Select one</option>
                  <option>On Hold</option>
                  <option>Canceled</option>
                  <option>Success</option>
               </select>
            </div>
            <div class="form-group">
               <label for="inputClientCompany">Client Company</label> 
               <input type="text" id="inputClientCompany" name="inputClientCompany" class="form-control">
            </div>
            <div class="form-group">
               <label for="inputProjectLeader">Project Leader</label> 
               <input type="text" id="inputProjectLeader" name="inputProjectLeader" class="form-control">
            </div>
         </div>

      </div>
   </div>
   <button type="button" id="btnSubmit">전송</button>
</form>
<script type="text/javascript">
// window.editor=editor; editor를 window.editor에 대입
// editor: ckeditor5객체
ClassicEditor.create( document.querySelector('#divDescription'),
{ckfinder:{uploadUrl:'/image/upload'}})
.then(editor=>{window.editor=editor;})
.catch(err=>{console.error(err.stack);});

$("#btnSubmit").on("click", function(){
	console.log(window.editor.getData());
	// ckeditor5에 작성된 데이터를 id="inputDescription"인 textarea에 넣어준다.
	$("#inputDescription").val(window.editor.getData());
	// document.frm.submit();
});
</script>
</body>
</html>