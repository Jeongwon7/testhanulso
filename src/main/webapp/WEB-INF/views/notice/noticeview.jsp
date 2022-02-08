<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<script src="/resources/js/reply.js"></script>

	<div class="sub_title">
		<h2>공지사항</h2>
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
					<a href="">질문답변<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="gratings.html">공지사항</a>
						<a href="gratings.html">질문답변</a>
						<a href="gratings.html">취업실적</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
		<div class="board_view">
			<h2>${nvo.title }</h2>
			<p class="info"><span class="user">${nvo.writer }
			</span> | <fmt:parseDate var="regdate" value="${nvo.regdate }" pattern="yyyy-MM-dd"/><!-- String에서 Date타입으로 -->
						<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/> | <i class="fa fa-eye"></i> ${nvo.viewcount}</p>
			<div class="board_body">
				${nvo.content }<!-- p태그 안에 쓰지말기 자동으로 들어가게 되어있대 나중에 고치겠다 했음 -->
			</div>
			<div class="prev_next">
			<c:if test="${prevVO != null}"><!-- 이전글이 있으면 -->
				<a href="noticeview.do?bno=${prevVO.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}" class="btn_prev">
					<i class="fa fa-angle-left"></i>
					<span class="prev_wrap">
						<strong>이전글</strong><span>${prevVO.title}</span>
					</span>
				</a>
			</c:if>
				<div class="btn_3wrap">
					<a href="notice.do?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}">목록</a><!-- 봤던 페이지로 돌아가도록 -->
					<sec:authorize access="isAuthenticated()"><!-- 로그인 했는지 -->
						<sec:authentication property="principal.member.userName" var="pinfo"/><!-- 로그인 햇을 때  -->
							<c:if test="${pinfo eq nvo.writer}">
								<a href="noticemodify.do?bno=${nvo.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}">수정</a>
								<a href="noticedelete.do?bno=${nvo.bno}" onClick="return confirm('삭제하시겠어요?')">삭제</a>
							</c:if>
					</sec:authorize>
				</div>
			<c:if test="${nextVO != null }">
				<a href="noticeview.do?bno=${nextVO.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}" class="btn_next">
					<span class="next_wrap">
						<strong>다음글</strong><span>${nextVO.title}</span>
					</span>
					<i class="fa fa-angle-right"></i>
				</a>
			</c:if>
			</div>
			
		</div>
		
<!-- <div class="containaer">
      <div class="cmt-container">
         <div class="cmtCount">Comments:</div>
         <div class="cmt-box">
            <textarea class="cmt-area" rows="4" cols="" placeholder="댓글을 입력"></textarea>
         </div>
         <div class="cmt-buttons">
            <button type="button" id="btnCmt" class="info cmt-insert" onclick="cmtWrite();">댓글등록</button>
         </div>
         <div class="cmtList-box">
            <ul id="addcmt">
            <c:forEach var = "list" items = "${cmtList }">
               <li class="reply">
                  <span><img src="images/ceo.jpg" alt="" class="cmt-icon thumb_profile"></span>
                  <span>
                     <span class="cmtWriter">${list.writer }</span>
                     <span class="cmtDate">${list.wdate }</span>
                     <span class="cmtContent">${list.content }</span>
                     <button style="float:right;" onclick=""></button>
                  </span>
               </li>
            </c:forEach>
            </ul>
         </div>
         </div>
   </div> -->	
	</div>
	
	<!-- 댓글 스프링 -->
	<div class="container" style="margin-top:60px;">
		<div class="row">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>Reply
				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New REPLY</button>
			</div>
		</div>
		<div class="row">
			<ul class="chat">
				<li class="left clearfix" data-rno="12">
					<div>
						<strong>User00</strong>
						<small class="pull-right">2022-01-12</small>
					</div>
					<p>썸머노트 조아요</p>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
	      </div>
	      <div class="modal-body">
	        <div class="form-group">
	        	<label>Reply</label>
	        	<input class="form-control" name="reply" value="New Reply">
	        </div>
	         <div class="form-group">
	        	<label>Replyer</label>
	        	<input class="form-control" name="replyer" value="replyer" readonly>
	        </div>
	         <div class="form-group">
	        	<label>Reply Date</label>
	        	<input class="form-control" name="replydate" value="" readonly>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
	        <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
	        <button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
	        <button id="modalCloseBtn" type="button" class="btn btn-default">Close</button>
	      </div>
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
         
         console.log(replyService);
         
         var bnoValue = '<c:out value="${nvo.bno}"/>';
         
         var replyUL = $(".chat");
         showList(1);
         
         function showList(page){
             replyService.getList({bno:bnoValue,page:page||1}, function(list){
                var str = "";
                if(list == null || list.length==0){
                   replyUL.html(str);
                   return;
                }//if문
                for(var i=0, len=list.length || 0; i<len; i++){
                   str += "<li class='left clerfix' data-rno='"+list[i].rno+"'>";
                   str += "<div><div class='header'><Strong class='primary-font'>"+list[i].replyer+"</strong>";
                   str += "<small class='pull-right text-muted'>"+list[i].replyDate+"</small>";
                   str += "<p>"+list[i].reply+"</p></div><li>";
                }//for문
                replyUL.html(str);
             });//getList(function{})
          }//showList(page)
         
         
         var modal = $(".modal");
         
         var modalInputReply = modal.find("input[name='reply']");
         var modalInputReplyer = modal.find("input[name='replyer']");
         var modalInputReplyDate = modal.find("input[name='replydate']");
         
         var modalModBtn = $("#modalModBtn");
         var modalRemoveBtn = $("#modalRemoveBtn");
         var modalRegisterBtn = $("#modalRegisterBtn");
         
         var replyer = null;
         
         <sec:authorize access="isAuthenticated()">
         	replyer = '<sec:authentication property="principal.username"/>';
         </sec:authorize>
         
         //스프링 시큐리티를 이용한다면 csrf토큰을 같이 전송하도록 해야함
         var csrfHeaderName = "${_csrf.headerName}";
         var csrfTokenValue = "${_csrf.token}";
         
         $("#modalCloseBtn").on("click", function(e){
            modal.modal("hide");
         })
         
         $("#addReplyBtn").on("click", function(e){
        	if(replyer==null){
        		alert("로그인 하세요");
        		location.href='/member/login.do';
        	}else{
        		 modal.find("input").val("");
                 modalInputReplyDate.closest("div").hide();
                 modal.find("input[name='replyer']").val(replyer);
                 modal.find("button[id != 'modalCloseBtn']").hide();
                 modalRegisterBtn.show();
                 $(".modal").modal("show");
        	}
           
         })
         
         //스프링시큐리티가 적용되면 post,put,patch,delete와 같은 방식으로 데이터를 전송하는 경우에는 
         //반드시 추가적으로  token과 같은 헤더 정보를 추가해서 csrf 토큰 값을 전달하도록 수정해야만 함.
         //ajax는 자바스크립트를 이용하기 때문에 브라우저에서는 csrf 토큰과 관련된 값을 변수로 선언하고, 전송시 포함시켜 줌.
         
         $(document).ajaxSend(function(e, xhr, options){
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
         })
         
         modalRegisterBtn.on("click", function(e){
            var reply = {
                  reply:modalInputReply.val(),
                  replyer:modalInputReplyer.val(),
                  bno:bnoValue
            }
            
            replyService.add(reply, function(result){
            alert(result);
               modal.find("input").val("");
               modal.modal("hide");
               showList(1);
            })
         })
         
         //댓글 li클릭 했을 때 모달에 해당 댓글 내용, 작성자, 날짜 출력
         $(".chat").on("click", "li", function(e){
        	 var rno = $(this).data("rno");//li에 data-rno의 값(댓글번호)을 가져온다
        	 replyService.get(rno, function(reply){
        		 modalInputReply.val(reply.reply);
        		 modalInputReplyer.val(reply.replyer);
        		 modalInputReplyDate.val(reply.replyDate);
        		 modal.data("rno", reply.rno);
        		 
        		 modal.find("button[id != 'modalCloseBtn']").hide();
        		 modalModBtn.show();
        		 modalRemoveBtn.show();
        		 
        		 $(".modal").modal("show");
        	 })
         })
         
        //댓글 수정
         modalModBtn.on("click", function(e){
        	 var originalReplyer = modalInputReplyer.val();
        	 
        	 if(!replyer){
        		 alert("로그인 후 수정 가능");
        		 modal.modal("hide");
        		 return;
        	 }
        	 
        	 
        	 if(replyer != originalReplyer){
        		 alert("자신이 작성한 댓글만 수정 가능");
        		 modal.modal("hide");
        		 return;
        	 }
        	 var reply = {
        			 rno:modal.data("rno"), 
        			 reply:modalInputReply.val(),
        			 replyer:originalReplyer
        			 };
        	//alert(reply.reply);
        	 replyService.update(reply, function(result){
        		 modal.modal("hide");
        		 showList(1);
        	 })
         })
         
         //댓글 삭제
         modalRemoveBtn.on("click", function(e){
        	 var originalReplyer = modalInputReplyer.val();
        	 
        	 if(!replyer){
        		 alert("로그인 후 삭제 가능");
        		 modal.modal("hide");
        		 return;
        	 }
        	
        	 if(replyer != originalReplyer){
        		 alert("자신이 작성한 댓글만 삭제 가능");
        		 modal.modal("hide");
        		 return;
        	 }
        	 var rno = modal.data("rno"); //css data-rno("12")
        	 replyService.remove(rno, originalReplyer, function(result){
        		 modal.modal("hide");
        		 showList(1);
        	 })
         })
         
      });
   </script>
	
	
	<script>
	//댓글 쓰기 (버튼을 눌러서 id값이 넘어와 실행되는 자바스크립트 구문)
    $("#btnReply").on("click", function(){
        var replytext = $("#replytext").val(); //댓글 내용
        var nbno="${nvo.bno}"; //게시물 번호
        var param={ "replytext": replytext, "nbno": nbno};
        //var param="replytext="+replytext+"&bno="+bno;
        $.ajax({
            type: "post", //데이터를 보낼 방식
            url: "noticereplywrite.do", //데이터를 보낼 url
            data: param, //보낼 데이터

            success: function(data){ //데이터를 보내는것이 성공했을시 출력되는 메시지
            	alert(data);
            	location.href="noticeview.do?bno=${nvo.bno}";
               // listReply(); //댓글 목록 출력
                
            },error:function(xhr, status, error) {
            	alert("통신에러");
            }
        });

    });
	
	
	
	function cmtWrite(){
		var bno = "${nvo.bno}";
		var cmtContent =$(".cmt-area").val();
		var writer = "${sessionScope.userid}";
		
		if(cmtContent == ""){
			alert("댓글 내용 입력");
			return false;
		}
		
		if(writer == ""){
			alert("댓글을 작성하려면 로그인해주세요");
			return false;
		}
		
		var cdData = {//제이슨 형식 데이터 ☆★
				bno:bno,
				writer:writer,
				content:cmtContent
		}
		
		$.ajax({
			type:'post',
			url:'noticeCmt.do',
			data:cdData,
			success: function(result){
				if(result == 1){
					$(".cmt-area").val("");
					getCmtList();//자바스크립트에서 함수 호출
				}else{
					alert("댓글 저장 실패");
					return false;
				}
			}
		})
		
	}
	
	function getCmtList(){
		var output = "";
		var logId = "${sessionScope.userid}";
		var bno = "${nvo.bno}";
		var cdData= {
				bno:bno,
		}
		
		$.ajax({
			type:'get',
			url:'noticeCmt.do',
			data:cdData,//보내는 데이터 타입
			dataType:"json",//받는 데이터 타입
			success:function(result){
				for(var i in result){//향상된 for문
					 output += '<ul id="addcmt">';
		             output += '<li class="reply">';
		             output += '<span><img src="images/ceo.jpg" alt="" class="cmt-icon thumb_profile"></span>';
		             output += '<span>';
		             output += ' <span class="cmtWriter">'+result[i].writer+'</span>';
		             output += '<span class="cmtDate">'+result[i].wdate+'</span>';
		             output += '<span class="cmtContent">'+result[i].content+'</span>';
		             if(result[i].writer == logId){
		            	 output += '<button style="float:right;" onclick="deleteCmt('+result[i].bno+')"></button>';
		             }
		             output += ' </span>';
		             output += ' </li>';
		             output += '</ul>';
				}
				$(".cmtList-box").html(output);
			}
		})//ajax
		
	}
	</script>

<%@ include file="../footer.jsp"%>