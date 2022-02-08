<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp" %>

<div class="sub_title">
		<h2>접속자 로그인</h2>
		<div class="container">
		  <div class="location">
			<ul>
				<li class="btn_home">
					<a href="index.html"><i class="fa fa-home btn_plus"></i></a>
				</li>
				<li class="dropdown">
					<a href="">커뮤니티<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="gratings.html">공지사항</a>
						<a href="allclass.html">학과및모집안내</a>
						<a href="portfolio.html">포트폴리오</a>
						<a href="online.html">온라인접수</a>
						<a href="notice.html">커뮤니티</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="">공지사항<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="notice.html">공지사항</a>
						<a href="qa.html">질문과답변</a>
						<a href="faq.html">FAQ</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
			<div class="member_boxL">
                <h2>개인회원</h2>
                <div class="login_form">
                <!--  폼에 액션과 메서드가 없을 때 자바스크립트로 추가하기-->
                    <form id="login" name="login" action="/login">
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <div class="fl_clear">
                    	<label for="id">아이디</label>
                    	<input name="username" id="id" type="text">
                    </div>
                    <div class="fl_clear">
                    	<label for="pw">비밀번호</label>
                    	<input name="password" id="pw" type="password">
                    </div>
                    <a class="btn_login btn_Blue" href="javascript:fn_login();">로그인</a>
                    </form>
                </div>
            </div>
	  
	</div>
	<!-- end contents -->
	
	<script>
		$(function() {
			$(".location  .dropdown > a").on("click",function(e) {
				e.preventDefault();
				if($(this).next().is(":visible")) {
					$(".location  .dropdown > a").next().hide();
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
			
			var msg = "${msg}";
			if(msg){
				alert("${msg}");//msg 값을 띄움
			}
			
			
		});
	</script>
	<script>
		function fn_login(){
			
			if(login.id.value==""){
				alert("아이디를 입력하세요");
				login.id.focus();
				return false;
			}
			if(login.pw.value==""){
				alert("패스워드를 입력하세요");
				login.pw.focus();
				return false;
			}
			
			var form = document.login;//폼 이름 login을 변수에 저장(다룰 수 있게 된다)
			form.method='post';
			form.action="/login";
			form.submit();
		}
	</script>

<%@ include file = "../footer.jsp" %>