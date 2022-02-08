<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>  


	<!-- sub contents -->
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
	  <div class="search_wrap">
		<div class="record_group">
			<p>총게시글<span>${pageMaker.total }</span>건</p><!-- ?=$count? php언어 ?= ?가 좌측깔대기퍼센트골뱅이 -->
		</div>
		<div class="search_group">
			<form name="myform" method="get" action="notice.do" id="searchForm">
				<select name="type" class="select">
					<option value="">선택</option>
					<option value="T">제목</option>
					<option value="C">내용</option>
					<option value="W">글쓴이</option>
					<option value="TC">제목+내용</option>
				</select>
				<input type="text" name="keyword" class="search_word">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
            	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				<button class="btn_search" type="submit"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
			</form>
		</div>
	  </div> <!-- search end -->
	  <div class="bord_list">
		<table class="bord_table" summary="이표는 번호,제목,글쓴이,날자,조회수로 구성되어 있습니다">
			<caption class="sr-only">공지사항 리스트</caption>
			<colgroup>
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:set var="num" value="${pageMaker.total - ((pageMaker.cri.pageNum-1) * 10)}"/>
			<c:forEach var="list" items="${list}">
			<!-- noticeList 속성이름(알아서 0번째 dto를 가리킨다) 
			c:forEach 는 반복문
			-->
				<tr>
					<td>${num}</td>
					<td class="title"><a href="noticeview.do?bno=${list.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${list.title}</a></td>					<td>${list.writer }</td>
					<td>
						<fmt:parseDate var="regdate" value="${list.regdate }" pattern="yyyy-MM-dd"/><!-- String에서 Date타입으로 -->
						<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/><!-- 날짜 형식을 출력 -->
					</td>
					<td>${list.viewcount}</td>
				</tr>
				<c:set var="num" value="${num-1}" />
			</c:forEach>
			</tbody>
		</table>
		<div class="paging">
			<c:if test="${pageMaker.prev }">
				<a href="${pageMaker.startPage-1}"><i class="fa  fa-angle-double-left"></i></a>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<a href="${num}" class="${pageMaker.cri.pageNum == num?'active':''}">${num}</a>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<a href="${pageMaker.endPage+1}"><i class="fa  fa-angle-double-right"></i></a>
			</c:if>
			
			<div>
				<sec:authorize access="isAuthenticated()">
					<a href="/notice/noticewrite.do" class="btn_write">글쓰기</a>
				</sec:authorize>
			</div>
	
			<form id="actionForm" action="notice.do" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
		</div>
	  </div>
	</div>
	<!-- end contents -->
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
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
			
			
			var actionForm = $("#actionForm");
			
			$(".paging > a").on("click", function(e){
				e.preventDefault();
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));//현재 페이지 번호의 값을 구해서 전송해라
				actionForm.submit();
			})
			
			
			var result =  '<c:out value="${result}" />';
			
			checkModal(result);
			
			function checkModal(result){
				if(result == ""){
					return;
				}
				if(parseInt(result)>0){
					$(".modal-body").html("게시글"+parseInt(result)+" 번 등록 완료");
				}
				if(result == 'success'){
					$(".modal-body").html("처리 완료");
				}
				
				$("#myModal").modal("show");
			}
			
			var searchForm = $("#searchForm");
			$("#searchForm button").on("click", function(e) {
				if(!searchForm.find("option:selected").val()){
					alert("검색종류를 선택하세요");
					return false;
				}
				if(!searchForm.find("input[name='keyword']").val()){
					alert("검색 키워드 입력");
					return false;
				}
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				
				searchForm.submit();
			})
			
		});
	</script>

<%@ include file="../footer.jsp"%>  