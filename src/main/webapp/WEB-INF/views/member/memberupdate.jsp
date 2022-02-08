<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp" %>

	<div class="sub_title">
		<h2>회원수정</h2>
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
		<div class="con_title">
            <h1>내정보(개인회원)</h1>
         <p>HOME / 마이페이지 / 내정보(개인회원)</p>
        </div>
        <form name="member" method="post" id="member" action="member.do">
		<div class="join_write col_989">
            <table class="table_write02" summary="회원가입을 위한 이름, 아이디, 비밀번호, 비밀번호확인, 소속, 유선전화번호, 휴대전화번호, 이메일, 주소, 본인확인질문, 본인확인답, 주활용사이트, 알림여부 정보 입력">
                <caption>회원가입을 위한 정보입력표</caption>
                <colgroup>
                    <col width="160px">
                    <col width="auto">
                </colgroup>
                <tbody id="joinDataBody">
                    <tr>
                        <th><label for="name">이름</label></th>
                        <td>
                            <input type="text" name="name" id="name"class="w300" value="${upmember.name}">
                            <span id="namemsg"></span>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="id">아이디<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="text" name="id" id="id" class="w300" value="${upmember.id}" readonly>
                            <span id="idmsg"></span>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw1">비밀번호<!-- <span class="must"><b>필수입력</b></span> --></label></th>
                        <td>
                            <input type="password" name="pw1" id="pw1" class="w300">
                            <p class="guideTxt"><span class="tc_point">영문(대문자 구분), 숫자, 특수문자의 조합</span>으로 9~13자로 작성해 주십시오.</p>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw2">비밀번호확인<!-- <span class="must"><b>필수입력</b></span> --></label></th>
                        <td>
                            <input type="password" name="pw2" id="pw2" class="w300">
                            <p class="guideTxt"><span class="tc_point">비밀번호 미입력시 기존비밀번호가 유지됩니다.</span></p>
                        </td>
                    </tr>
                   
					<tr>
                        <th><label for="phone">전화번호<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="text" name="phone" id="phone" class="w300" value="${upmember.phone}">
                        </td>
                    </tr>
                    <tr>
                        <th><label for="email">이메일<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="email" name="email" id="email" class="w300" value="${upmember.email}">
                        </td>
                    </tr>
                    
            </table>
            	<div class="btnArea Acenter pt60 pb100">
				<!-- <a href="javascript:fn_save();" class="btn_round btn_large btn_pointColor w180"><b>회원가입</b></a> -->	
					<a href="javascript:void(0);" class="btn_round btn_large btn_pointColor w180" id="btn_ok"><b>회원수정</b></a>
    			    <a href="javascript:history.go(-1);" class="btn_round btn_large btn_BlueGray w180"><b>뒤로가기</b></a>
   			 </div>
        </div>
        </form>
	</div>
	<!-- end contents -->
	
	
	
	
	<script>
		$(function() {
			$(".location  .dropdown > a").on("click",function(e) {
				e.preventDefault();
				if($(this).next().is(":visible")) {//디스의 다음요소가 보이면
					$(".location  .dropdown > a").next().hide();//이것의 다음 요소를 숨겨라
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();//클릭한 상태의 다음요소만 보여라
				}
			});
			
			
			$("#btn_ok").on("click", function(){
				$("#member").submit();//form태그에 action이 실행된다
			})//btn_ok end
			
		
			
			$("#name").blur(function(){
				if(!$("#name").val()){//네임 값이 없으면
					$("#namemsg").html("<span style='color:#f00;'>이름을 입력하세요</span>");
					
				}
			})
			
		
			
		});//end
	</script>
	

<%@ include file = "../footer.jsp" %>