<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
MemberDto login = (MemberDto) session.getAttribute("login");
if (login == null) {
%>

<script type="text/javascript">
	alert('로그인 해 주십시오');
	location.href = "login.jsp";
</script>
<%
}
%>

<%
int seq = Integer.parseInt(request.getParameter("seq"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js"
	type="text/javascript"></script>
	<style type="text/css">
	
	body{
	text-align: center;
	padding: 40px;
	}
	input {
	
	width: 50%;
	padding: 10px;
	box-sizing: border-box;
	border-radius: 5px;
}
	</style>
</head>
<body>

<%
	BbsDto dto = BbsDao.getInstance().getBbs(seq);
	
	
%>

<h1 align="center">글 수정</h1>
<div class="center">

<form action="updateAf.jsp" method="post">

<input type="text" placeholder="글 제목" size="20" id = "title" name = "title" value="<%=dto.getTitle() %>">
<br><br>
<input type="hidden" name = "seq" value="<%=dto.getSeq() %>">
<input type="hidden" placeholder="작성자"  id = "id" name = "id" value="<%=login.getId() %>" readonly="readonly">

<br><br>
<input type="text" placeholder="글 내용" style="height: 350px;" id = "content" name = "content" value = "<%=dto.getContent() %>">

<br><br>

<input type="submit" value="수정" class = "sub">


</form>


</div>
</body>
</html>