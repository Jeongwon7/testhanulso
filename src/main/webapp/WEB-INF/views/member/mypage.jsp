<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp" %>

<div class="sub_title">
		<h2>메일 인증</h2>
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
                <h2>메일 인증 </h2>
                <div class="login_form">
                <!--  폼에 액션과 메서드가 없을 때 자바스크립트로 추가하기-->
                    <form id="login" name="login">
                    <div class="fl_clear">
                    	<input name="email" id="email" type="text" placeholder="이메일 입력">
                    	<input type="button" value ="이메일 인증" id="btn_email" style="display:inline-block; width:100px; background:#2b7272; color:#fff;">
                    </div>
                    <div class="fl_clear">
                    	<input name="certinumber" id="certinumber" type="text" placeholder="인증번호 입력">
                    	<input type="button" value ="인증 확인" id="btn_ok" style="display:inline-block; width:100px; background:#2b7272;color:#fff;">
                    </div>
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
			
			//이메일인증
				$("#btn_email").on("click", function(){
					var email = $("#email").val();
					if(email == ""){
						alert("이메일 주소 입력");
						$("#email").focus();
					}else {
						$.ajax({
							type:'post',
							url:'emailsend.do',
							data:{"email":$("#email").val()},
							dataType:'json',//서버로부터 응답받는 데이터 타입
							success:function(data){
								alert(data.msg);
								
							},
							error:function(){
								alert("통신에러");
							}
							
						})
					}
				})
				
				
			//인증확인 버튼 이벤트 처리
			$("#btn_ok").on("click", function(){
				var certinumber = $("#certinumber").val();
				//입력받은 인증번호
				if(certinumber == ""){
					alert("인증번호를 입력하세요");
					$("#certinumber").focus();
				}else{
					$.ajax({
						type:"post",
						data:{"certinumber":certinumber},//인풋에서 입력받은 거랑 인증번호랑 맞는지?
						url:"mypage.do",
						dataType:"json",
						//서버에서 넘어오는 데이터 형식 JSON{name:"value"}
						success:function(data){
							alert(data.msg);
							if(data.check == "ok"){
						//		location.href="memberupdate.do"
								$(location).attr("href", "memberupdate.do");
								//href 속성에 멤버업데이트.두 넣고 location 실행 ->  멤버업데이트.두가 실행된다
							}
						},error:function(){
							alert("통신에러");
						}
					})
				}
				
			})
			});
	</script>

	



<%@ include file = "../footer.jsp" %>