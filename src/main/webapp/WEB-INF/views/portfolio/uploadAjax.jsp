<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<input type="file" name="uploadFile" multiple>
	<button id="uploadBtn">submit</button>
	<script>
		$(function(){
			$("#uploadBtn").on("click", function(e){
				var formData = new FormData(); //가상의 폼 양식을 만들어라
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files);
				
				for(var i=0; i<files.length; i++){
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url: "/portfolio/uploadAjaxAction.do",
					processData:false, //기본값 true 데이터를 컨텐츠 타입에 맞게 변환하는 여부
					contentType:false,//기본 true - application/json, false이면 multipart/form-data 형식으로 전송이 된다
					data:formData,
					type:'post',
					success:function(result){
						alert("upload ok");
					}
				})//ajax end
			})//onclick end
			
		})
	</script>
</body>
</html>