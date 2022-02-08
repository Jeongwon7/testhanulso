<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="sub_title">
		<h2>갤러리</h2>
		<div class="container">
		  <div class="location">
			<ul>
				<li class="btn_home">
					<a href="index.html"><i class="fa fa-home btn_plus"></i></a>
				</li>
				<li class="dropdown">
					<a href="">갤러리<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="../about/gratings.html">기업소개</a>
						<a href="../portfolio/portfolio.html">갤러리</a>
						<a href="../notice/notice.html">커뮤니티</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="">갤러리<i class="fa fa-plus btn_plus"></i></a>
					<div class="dropdown_menu">
						<a href="portfolio.html">갤러리</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
	  <div class="search_wrap">
		<div class="record_group">
			<p>총게시글<span>120</span>건</p>
		</div>
		<div class="search_group">
			<form name="myform" action="">
				<select name="sel" class="select">
					<option value="1">제목</option>
					<option value="2">내용</option>
				</select>
				<input type="text" name="search" class="search_word">
				<button class="btn_search"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
			</form>
		</div>
	  </div> <!-- search end -->
	  <div class="bord_list">
	    <div class="gallery_wrap">
			<ul>
			<c:forEach var="list" items="${glist}">
				<li>
					<a href="" id="${list.bno}">
						<span style="display:block; height:282px; overflow:hidden;">
							<img src="${pageContext.request.contextPath}/upload/${list.imgurl}" alt="">
						</span>
					</a>
					<span class="title">${list.title}</span>
					<div class="gallery_count">
						<span class="count"><i class="fa fa-eye"></i></span>
						<span class="${list.bno}">&nbsp;${list.viewcount}</span>
					</div>
				</li>
			</c:forEach>
			</ul>
		  </div>
		
		<!-- modal process -->

		<div class="modal">
			
			<div class="modal_background">
			</div>
			<div class="modal_content">
				<a href=""><i class="fa fa-close"></i></a>
				<div class="modal_body">
					
				</div>
			</div>
		</div>

		<div class="paging">
			<a href=""><i class="fa  fa-angle-double-left"></i></a>
			<a href=""><i class="fa fa-angle-left"></i></a>
			<a href="" class="active">1</a>
			<a href="">2</a>
			<a href="">3</a>
			<a href="">4</a>
			<a href="">5</a>
			<a href=""><i class="fa fa-angle-right"></i></a>
			<a href=""><i class="fa  fa-angle-double-right"></i></a>
			<a href="gallerywrite.do" class="btn_write">글쓰기</a>
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

		$(".gallery_wrap > ul > li > a").on("click",function(e) {
			e.preventDefault();
			var imgsrc = $(this).find("img").attr("src");//attr("src"); 속성 값 뽑아온다, find() 모든 자식 검색, children()바로 밑 자식 검색
		//	var title = $(this).next().html();
			
			console.log(imgsrc);
		//	console.log(title);
			
			
			$(".modal .modal_content .modal_body").html("<img src='"+ imgsrc +"'>");//html 형식으로 삽입
			
			$(".modal").fadeIn(1000);
			
			var no = $(this).attr("id");//자기자신의 id 속성의 값이 no에 저장된다
			console.log(no);
			
			$.ajax({//비동기식 데이터처리 함수, 속성
					type: "post",
					url: "viewcount.do", //서블렛으로~
					data:{bno:no}, 
					//전송할 데이터 <a href="viewcount.do?bno=${list.bno}" no에 들어갈 값을 bno에 저장, url로(post방식) 보낸다
					success:function(data) {
						var count = data;//서블릿으로부터 매개변수 data를 받아 count 변수에 저장
						$(".gallery_wrap > ul > li > .gallery_count ."+no).html(count);
					},error:function(xhr, status, error) {
						alert("통신에러");
					}
				})
			
			
			$(".modal .modal_content > a").on("click", function(e) {
				e.preventDefault();
				$(".modal").fadeOut(1000);
			});
		});
		

		});
	</script>
	

<%@ include file="../footer.jsp"%>