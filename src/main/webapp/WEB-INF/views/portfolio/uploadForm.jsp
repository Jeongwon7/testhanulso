<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/portfolio/uploadFormAction.do" method="post" enctype="multipart/form-data">
		<input type="file" name="uploadFile" multiple>
		<button>submit</button><!-- 기본 설정이 submit 이어서 type="submit" 생략 -->
	</form>
</body>
</html>