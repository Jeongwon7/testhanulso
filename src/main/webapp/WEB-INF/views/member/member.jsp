<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp" %>

	<div class="sub_title">
		<h2>회원가입</h2>
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
        <form name="member" method="post" action="memberinsert.do" id="member">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="join_write col_989">
                <div class="list_con">
                	<div>
                		<input type="checkbox" id="chkCtrl">전체동의
                	</div>
                		<h2>이용약관</h2>
                    	<textarea style="padding:18px; width:100%; height:100px;">네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
                    </textarea>
                    <div>
                    	<input type="checkbox" name="agree" id="agree1" value="y">동의합니다
                    </div>
                    	<h2>개인정보 수집 및 이용 동의</h2>
                    	<textarea style="padding:18px; width:100%; height:100px;">네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
                    	</textarea>
                    <div>
                    	<input type="checkbox" name="agree" id="agree2" value="y">동의합니다
                    </div>
                    <p id="agreemsg" style="padding-bottom:30px;"></p>
                </div>
            <table class="table_write02" summary="회원가입을 위한 이름, 아이디, 비밀번호, 비밀번호확인, 소속, 유선전화번호, 휴대전화번호, 이메일, 주소, 본인확인질문, 본인확인답, 주활용사이트, 알림여부 정보 입력">
                <caption>회원가입을 위한 정보입력표</caption>
                <colgroup>
                    <col width="160px">
                    <col width="auto">
                </colgroup>
                <tbody id="joinDataBody">
                    <tr>
                        <th><label for="username">이름</label></th>
                        <td>
                            <input type="text" name="userName" id="name"class="w300">
                            <span id="namemsg"></span>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="id">아이디<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="text" name="userid" id="id" class="w300">
                            <span id="idmsg"></span>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw1">비밀번호<!-- <span class="must"><b>필수입력</b></span> --></label></th>
                        <td>
                            <input type="password" name="userpw" id="pw1" class="w300">
                            <p class="guideTxt"><span class="tc_point">영문(대문자 구분), 숫자, 특수문자의 조합</span>으로 9~13자로 작성해 주십시오.</p>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="pw2">비밀번호확인<!-- <span class="must"><b>필수입력</b></span> --></label></th>
                        <td>
                            <input type="password" name="userpw2" id="pw2" class="w300">
                            <p class="guideTxt"><span class="tc_point">비밀번호 미입력시 기존비밀번호가 유지됩니다.</span></p>
                        </td>
                    </tr>
                   
					<tr>
                        <th><label for="tel">전화번호<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="text" name="tel" id="phone" class="w300" >
                        </td>
                    </tr>
                    <tr>
                        <th><label for="email">이메일<span class="must"><b>필수입력</b></span></label></th>
                        <td>
                            <input type="text" name="email" id="email" class="w300">
                        </td>
                    </tr>
                    
            </table>
            	<div class="btnArea Acenter pt60 pb100">
				<!-- <a href="javascript:fn_save();" class="btn_round btn_large btn_pointColor w180"><b>회원가입</b></a> -->	
					<a href="javascript:void(0);" class="btn_round btn_large btn_pointColor w180" id="btn_ok"><b>회원가입</b></a>
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
			
			var chkList = $("input[name=agree]");//(name이 agree인 두 개)배열상태로 변수에 저장된다
			
			$("#chkCtrl").click(function(){
				if($(this).is(":checked")){//전체동의 체크 상태이면
					chkList.prop("checked", true);//체크상태 확인 함수
				}else{
					chkList.prop("checked", false);
				}
			})
			
			$("#agree1, #agree2").on("click", function(){
				if($("#agree1").is(":checked") == true && $("#agree2").is(":checked") == true){
					$("#chkCtrl").prop("checked", true);
				}else{
					$("#chkCtrl").prop("checked", false);
				}
			})
			
			$("#btn_ok").on("click", function(){
				//if($("#agree").is(":checked") == false){//체크 안했으면
				//	$("#agreemsg").html("<span style='color:#f00;'>모든 약관동의 체크하세요</span>");
		    	//	}
				
				var chk = true;
				
				for(var i=0; i<chkList.length; i++){
					if(!chkList[i].checked){
						chk = false;
					}
				}
				
				if(!chk){
					alert("모든 약관에 동의해 주세요");
					return false;
				}
				
				if(!$("#name").val()){
		               alert("이름을 입력하시오");
		               $("#name").focus();
		               return false;
		            }
				
				$("#member").submit();//form태그에 action이 실행된다
				
			
			})//btn_ok end
			
			//$("#agree").on("click", function(){
			//	if($("#agree").is(":checked")){//체크 했으면
			//		$("#agreemsg").html("");
			//	}
			//})
			
			
			
		
			
			$("#name").blur(function(){
				if(!$("#name").val()){//네임 값이 없으면
					$("#namemsg").html("<span style='color:#f00;'>이름을 입력하세요</span>");
					
				}
			})
			
			$("#id").blur(function(){//input id 위치를 벗어났을 때
				var idCheck = $("#id").val();
				
				if(!$("#id").val()){
					$("#idmsg").html("<span style='color:#f00;'>아이디 입력하세요</span>");
				
				}
				$.ajax({

					  type:'get',
					  url:'/member/checkUserid.do?userid='+idCheck,
					  dataType:"json",
					//data:{id:$("#id").val()},
					  
					  success:function(data) {
						  if(data != 1){
							  if($("#id").val() != ""){//and 조건
								  $("#idmsg").html("사용가능한 아이디입니다");
							  }
						  }else{//data(result)가 0이면
							  if($("#id").val() != ""){
								  $("#idmsg").html("사용중이거나 탈퇴한 아이디입니다");
								  $("#id").val("");
								  $("#id").focus();
							  	
							  }
						  }
					     
					  },
					  error : function(xhr,status,error) {
					      alert("통신에러")
					  },
					  
					});
			})
			
		});//end
	</script>
	
	<script>
		function fn_save() {
			//입력받은 값들을 유효성 검사하고
			if(!member.name.value){
				alert("이름을 입력하세요");
				member.name.focus();
				return false;
			}
			//서버로 전송한다(action)
			member.submit();//폼요소를 submit
		}
	</script>

<%@ include file = "../footer.jsp" %>