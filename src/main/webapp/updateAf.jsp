<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
int seq = Integer.parseInt( request.getParameter("seq") );


String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

BbsDao dao = BbsDao.getInstance();
boolean isS = dao.update(seq, title, content);
if(isS){

%>

<script type="text/javascript">
alert("수정을 완료했습니다");
location.href = "bbslist.jsp";
</script>
<%
	}else{
%>
<script type="text/javascript">
alert("다시 기입해주십시오");
let seq = "<%=seq %>";
location.href = "updateBbs.jsp?seq=" + seq;
</script>
<%
}
%>