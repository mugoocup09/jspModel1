<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    	<%
	MemberDto login = (MemberDto) session.getAttribute("login");
	if (login == null) {
	%>
	<script>
		alert('로그인 해 주십시오');
		location.href = "login.jsp";
	</script>
	<%
	}
	%>
    
<%
int seq = Integer.parseInt( request.getParameter("seq") );

BbsDao dao = BbsDao.getInstance();
boolean isS = dao.delete(seq);
if(isS){
	%>      
    <script>
	alert("삭제하였습니다");

	location.href = "bbslist.jsp";
	</script>
	<%
}else{	
	%>
	<script>
	alert("삭제되지 않았습니다");
	let seq = " <%=seq %> ";
	location.href = "bbsDetail.jsp?seq=" + seq;
	</script>
	<%
}
%>

 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>