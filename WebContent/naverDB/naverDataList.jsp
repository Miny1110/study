<%@page import="com.naver.NaverDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.naver.NaverDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Connection conn = DBConn.getConnection();
	NaverDAO dao = new NaverDAO(conn);

	List<NaverDTO> lists = dao.getList();
	
	DBConn.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

body{
	font-size: 9pt;
}

td{
	font-size: 9pt;
}

.btn{
	font-size: 9pt;
	background: #e6e6e6;
	
}

a{
	text-decoration: none;
	color: blue;
}

</style>

</head>


<body>

<br/><br/>

<table width="700" cellpadding="0" cellspacing="3" align="center" bgcolor="#e4e4e4">
<tr height="50">
	<td bgcolor="#ffffff" style="padding-left: 10px;">
	<b>회원가입 정보 리스트</b>
	</td>
</tr>
</table>
<br/>

<table width="650" cellpadding="0" cellspacing="3" align="center">
<tr height="35">
	<td align="right">
	<input type="button" class="btn" value=" 회원가입 " onclick="location='<%=cp%>/naverDB/naver.jsp'">
	</td>
</tr>
</table>

<table width="680" cellpadding="0" cellspacing="1" align="center" bgcolor="#cccccc">
<tr height="30">
	<td align="center" bgcolor="#e6e6e6" width="100">아이디</td>
	<td align="center" bgcolor="#e6e6e6" width="100">비밀번호</td>
	<td align="center" bgcolor="#e6e6e6" width="130">생년월일</td>
	<td align="center" bgcolor="#e6e6e6" width="70">성별</td>
	<td align="center" bgcolor="#e6e6e6" width="150">이메일</td>
	<td align="center" bgcolor="#e6e6e6" width="100">휴대전화</td>
	<td align="center" bgcolor="#e6e6e6" width="130">수정</td>
</tr>

<%for(NaverDTO dto : lists){ %>
<tr height="30">
	<td align="center" bgcolor="#ffffff"><%=dto.getUserId() %></td>
	<td align="center" bgcolor="#ffffff"><%=dto.getUserPwd() %></td>
	<td align="center" bgcolor="#ffffff"><%=dto.getBirthYear() %>년&nbsp;<%=dto.getBirthMonth() %>월&nbsp;<%=dto.getBirthDay() %>일</td>
	<td align="center" bgcolor="#ffffff"><%=dto.getGender() %></td>
	<td align="center" bgcolor="#ffffff"><%=dto.getEmail() %></td>
	<td align="center" bgcolor="#ffffff"><%=dto.getTel() %></td>
	<td align="center" bgcolor="#ffffff">
	<a href="<%=cp %>/naverDB/update.jsp?userId=<%=dto.getUserId()%>">수정</a>
	<a href="<%=cp %>/naverDB/delete_ok.jsp?userId=<%=dto.getUserId()%>">삭제</a></td>
</tr>
<%} %>
</table>

<table width="650" cellpadding="0" cellspacing="3" align="center">
<tr height="35">
	<td align="right">
	<input type="button" class="btn" value=" 돌아가기 " onclick="location='<%=cp%>'">
	</td>
</tr>
</table>

</body>
</html>