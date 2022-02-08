<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="upload" method="post" enctype="multipart/form-data" action="/sample/upload">
		<input type="file" name="files"><!-- name이 같은 것에 주목 -->
		<input type="file" name="files">
		<input type="file" name="files">
		<input type="submit" value="upload">
	</form>
</body>
</html>