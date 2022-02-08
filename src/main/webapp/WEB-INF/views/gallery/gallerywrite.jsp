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
	  <div class="write_wrap">
	  <h2 class="sr-only">갤러리 글쓰기</h2>
	  <form name="photo" method="post" enctype="multipart/form-data" action="gallerywritepro.do" onsubmit="return check()">
	  <!-- action을 처리하기전에 check()사용자 함수를 실행하고 되돌아 와라-->
			<table class="bord_table">
				<caption class="sr-only">공지사항 입력 표</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
					
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부</th>
						<td><input type="file" name="imgurl" id="isFile"></td>
					</tr>
				</tbody>
			</table>
			<div class="btn_wrap">
				<input type="submit" value="저장" class="btn_ok">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" class="btn_reset">&nbsp;&nbsp;
				<input type="button" value="목록" class="btn_list" onClick="location.href='gallery.do';">
			</div>
		</form>
	  </div>
	  
	</div>
	<!-- end contents -->
	<script>
		function check() {
			
			if(photo.title.value=="") {
				alert("제목을 입력");
				photo.title.focus();
				return false;
			}
			if(photo.content.value=="") {
				alert("내용을 입력");
				photo.content.focus();
				return false;
			}
			
			var imgFile = $('#isFile').val();
			var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;//자바스크립트 정규 표현식
			var maxSize = 20 * 1024 * 1024;
			var fileSize;

			if($('#isFile').val() == "") {
				alert("첨부파일은 필수!");
			    $("#isFile").focus();
			    return false;
			}

			if(imgFile != "" && imgFile != null) {
				fileSize = document.getElementById("isFile").files[0].size;
			    
			    if(!imgFile.match(fileForm)) {
			    	alert("이미지 파일만 업로드 가능");
			        return false;
			    } else if(fileSize >= maxSize) {
			    	alert("파일 사이즈는 20MB까지 가능");
			        return false;
			    }
			}
			
			return true;
			
		}
	</script>
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