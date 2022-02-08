<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminheader.jsp" %>

<div class="container">
   <h1>관리자님 환영합니다</h1>
   <p>principal <sec:authentication property="principal"/>
   <p>MemberVO <sec:authentication property="principal.member"/>
   <sec:authentication property="principal.member.userName"/>
   <sec:authentication property="principal.member.userid"/>
    <p>사용자 권한 리스트 <sec:authentication property="principal.member.authList"/>
</div>
</body>
</html>
