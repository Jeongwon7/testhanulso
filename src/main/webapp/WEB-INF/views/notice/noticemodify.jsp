<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp"%>


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
						<a href="gratings.html">공지사항</a>
						<a href="gratings.html">DW인터뷰</a>
						<a href="gratings.html">취업실적</a>
					</div>
				</li>
			</ul>
		  </div>
		</div><!-- container end -->
	</div>

	<div class="container">
	  <div class="write_wrap">
	  <h2 class="sr-only">공지사항 수정하기</h2>
	  <form name="notice" method="post" action="noticemodifypro.do" onsubmit="return check()">
	  	<input type="hidden" name="bno" value="${nvo.bno}"><!-- 중요중요중ㅇ요중요중요중요중요중ㅇ쵸 겟방식처럼 bno넘길 수 없음-->
		<input type="hidden" name="pageNum" value="${cri.pageNum}">
		<input type="hidden" name="amount" value="${cri.amount }">
			<table class="bord_table">
				<caption class="sr-only">공지사항 입력 표</caption>
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr class="first">
						<th>글쓴이</th>
						<td><input type="text" name="writer" value="${nvo.writer}" readonly></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value="${nvo.title}"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" id="summernote" >${nvo.content}</textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="btn_wrap">
				<input type="submit" value="저장" class="btn_ok">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" class="btn_reset">&nbsp;&nbsp;
				<input type="button" value="목록" class="btn_list" onClick="location.href='notice.do';">
			</div>
		</form>
	  </div>
	  
	</div>
	<!-- end contents -->
	<script>
		function check() {
			if(notice.writer.value=="") {
				alert("글쓴이 입력");
				notice.writer.focus();
				return false;
			}
			if(notice.title.value=="") {
				alert("제목을 입력");
				notice.title.focus();
				return false;
			}
			if(notice.content.value=="") {
				alert("내용을 입력");
				notice.contents.focus();
				return false;
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
			
			
			//썸머노트
			$('#summernote').summernote({
				height: 400,
				fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
				fontNamesIgnoreCheck : [ '맑은고딕' ],
				focus: true,

				callbacks: {//콜백★ 썸머노트 안에는 콜백 기능이 없다 https://www.w3schools.com/jquery/jquery_callback.asp
				onImageUpload: function(files, editor, welEditable) {
				            for (var i = files.length - 1; i >= 0; i--) {//이미지 5개 삽입: files.length = 이미지 삽입 길이(5)
				             sendFile(files[i], this);
				            //삽입한 이미지를 sendFile 메서드로 보내라는
				            }
				        }
				}

				});

				

				function sendFile(file, el) {
				var form_data = new FormData();
				       form_data.append('file', file);
				       $.ajax({
				         data: form_data,
				         type: "POST",
				         url: 'profileImage.do',//앞에 슬래시(/)치지 않기..!
				         cache: false,
				         contentType: false,
				         enctype: 'multipart/form-data',//첨부가 있을 때
				         processData: false,
				         success: function(img_name) {
				           $(el).summernote('editor.insertImage', img_name);//얜 개발자가 만들어놓은 거니까 건들지 말기
				         }
				       });
				    }
		});
	</script>


<%@ include file="../footer.jsp"%>