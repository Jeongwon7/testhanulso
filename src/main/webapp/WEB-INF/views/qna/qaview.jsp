<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

	<div class="sub_title">
		<h2>질문답변</h2>
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
			<h2>${vo.title}</h2>
			<p class="info"><span class="user">${vo.writer}</span> |<fmt:formatDate var="regdate" value="${vo.regdate}" pattern="yyyy-MM-dd"/>${regdate} | <i class="fa fa-eye"></i> ${vo.viewcount}</p>
			<div class="board_body">
				<p>${vo.content}</p>
			</div>
			<div>
				<h2>답변 내용</h2>
				<c:if test="${vo.status == 1}">
					<div>
						${vo.ancontent}
					</div>
				</c:if>
				<c:if test="${vo.status == 0}">
					<div>
						<p style="text-align:center;">답변이 등록되지 않았습니다</p>
					</div>
				</c:if>
			</div>
			<c:if test="${vo.status == 0}">
					<sec:authorize access="isAuthenticated()"><!-- 로그인 했는지 -->
						<sec:authentication property="principal.member.userid" var="id"/><!-- 로그인 햇을 때  -->
							<c:if test="${id eq 'admin'}">
								<div>
									<form name="reply" method="post" action="/qna/reply.do">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										<input type="hidden" name="bno" value="${vo.bno}">
											<textarea name="ancontent" style="width:80%; vertical-align:top; height:30px;"></textarea>
											<input type="submit" value="등록" style="height:30px;">
									</form>
								</div>
							</c:if>
					</sec:authorize>
			</c:if>
			<div class="prev_next">
				<a href="" class="btn_prev"><i class="fa fa-angle-left"></i>
				<span class="prev_wrap">
					<strong>이전글</strong><span>이전글제목표시</span>
				</span>
				</a>
				<div class="btn_3wrap">
					<a href="/qna/qa.do">목록</a> <a href="qa_modify.html">수정</a> <a href="qa_delete.html" onClick="return confirm('삭제하시겠어요?')">삭제</a>
				</div>
				<a href="" class="btn_next">
				<span class="next_wrap">
					<strong>다음글</strong><span>다음글제목표시</span>
				</span>
				<i class="fa fa-angle-right"></i></a>
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
		});
	</script>

<%@ include file="../footer.jsp"%>