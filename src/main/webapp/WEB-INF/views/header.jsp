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
 <!-- 
 웹문서 만들기 기본 공식
 1. 요소를 어떻게 묶을 것인가? 그룹만들기
 2. 그룹안에 적절한 태그 사용
 3. class 이름 붙이고 css 적용
 -->
	<div class="sr-only">
		<p><a href="#contents">본문 바로가기</a></p>
	</div>

	<div class="top_navigation">
	
		<header class="header">
			<nav class="top_left">
			  <ul>
			  	<li class="first"><a href="main.do">HOME</a></li>
				<li><a href="">모집안내</a></li>
				<li><a href="">입학상담</a></li>
				<li><a href="">교육신청</a></li>
			  </ul>
			</nav>
			<nav class="top_right">
				<ul>
					<sec:authorize access="isAnonymous()">
						<li class="first"><a href="/member/login.do">로그인</a></li>
						<li><a href="/member/member.do">회원가입</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li class="first">
							<form name="logout" method="post" action="/adm/adminLogout">
				        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				        		<button type="submit" style="border:0 none; backgroung:transparent;">로그아웃</button>
				        	</form>
						</li>
						<li><a href="mypage.do">마이페이지</a></li>
					</sec:authorize>
				</ul>
			</nav>
			
			<div class="gnb_group">
				<h1 class="logo">JSL CO</h1>
				<nav class="gnb">
					<ul class="nav_1depth">
						<li><a href="gratings.html">기업소개</a>
							<ul class="nav_2depth">
								<li><a href="about/gratings.html">인사말</a></li>
								<li><a href="about/history.html">연혁 및 </a></li>
								<li><a href="about/gratings.html">교직원소개</a></li>
								<li><a href="gallery.do">갤러리</a></li>
								<li><a href="about/map.html">찾아오시는길</a></li>
							</ul>
						</li>
						<!--<li><a href="allclass.html">학과및모집안내</a>
							<ul class="nav_2depth">
								<li><a href="#">전체모집과정</a></li>
								<li><a href="#">스마트웹콘텐츠개발과정</a></li>
							</ul>
						</li> -->
						<li><a href="/portfolio/portfolio.do">포트폴리오</a>
							<ul class="nav_2depth">
								<li><a href="portfolio.do">포트폴리오</a></li>
							</ul>
						</li>
						<!-- <li><a href="online.html">온라인접수</a>
							<ul class="nav_2depth">
								<li><a href="#">온라인접수</a></li>
								<li><a href="#">취업성공패키지</a></li>
							</ul>
						</li> -->
						<li><a href="notice.html">커뮤니티</a>
							<ul class="nav_2depth">
								<li><a href="/notice/notice.do">공지사항</a></li><!-- a도 겟방식 -->
								<li><a href="/qna/qa.do">질문과답변</a></li>
								<li><a href="/faq/faq.do">FAQ</a></li>
								<li><a href="/pds/pds.do">자료실</a></li>
								<li><a href="/adm/admin.do">관리자</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</header>

		<div class="line">
		</div>

	</div>

	<script>
		//$(document).ready(function() {
		$(function() {
			$(".gnb>.nav_1depth>li").hover(function() {
				$(".gnb>.nav_1depth>li").removeClass();
				$(this).addClass("active");

				//$(this).children(".nav_2depth").show();
				//}, function() {
				//  $(".gnb>.nav_1depth>li").removeClass();
				//  $(this).children(".nav_2depth").hide();
				//	});

				$(this).children(".nav_2depth").stop().slideDown("fast");
				}, function() {
				  $(".gnb>.nav_1depth>li").removeClass();
				  $(this).children(".nav_2depth").stop().slideUp("fast");
					});

				/* $(this).children(".nav_2depth").fadeIn();
				}, function() {
				  $(".gnb>.nav_1depth>li").removeClass();
				  $(this).children(".nav_2depth").fadeOut0();
					}); */

			});
	</script>