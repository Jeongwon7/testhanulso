<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<!doctype html>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="JSL">
  <meta name="Keywords" content="반응형홈페이지,  JAVA, JSP, PHP, 대전직업전문학교, 대전국비지원, 국비무료">
  <meta name="Description" content="응용SW개발자를 위한 반응형 홈페이지">
  <title>JSL인재개발원</title>
  <!-- 썸머노트 사용하기 -->
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/css/summernote.min.css" rel='stylesheet'>
  <!-- 썸머노트 -->
  <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
  <link href="/resources/css/common.css" rel="stylesheet">
  <link href="/resources/css/layout.css" rel='stylesheet'>
  <!--
  	jquery언어 사용법
	1. jquey.js을 기반으로 프로그램을 작성하기 때문에 jquery.js 파일을 다운 또는 CDN 방식으로 링크를 건다
	2. $(function() {
		실행문;
	});
  -->
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
  <script src="/resources/js/jquery-3.3.1.min.js"></script>
  <!-- 썸머노트 사용하기 -->
   <script src="/resources/js/bootstrap.min.js"></script>
   <script src="/resources/js/summernote.min.js"></script><!-- 썸머노트 -->
  

 </head>
 <body>
 <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/adm/adminmanager">HANULSO</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">상품관리<span class="sr-only">(current)</span></a></li>
        <li><a href="#">주문관리</a></li>
         <li><a href="#">회원관리</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객센터 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">질문답변</a></li>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">공지사항</a></li>
            <li class="divider"></li>
            <li><a href="#">포트폴리오</a></li>
            <li class="divider"></li>
            <li><a href="#">상품후기</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li>
        	<form name="logout" method="post" action="/adm/adminLogout">
        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        		<button type="submit">로그아웃</button>
        	</form>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</body>
</html>