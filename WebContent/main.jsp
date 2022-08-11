<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table width="400" border="1">
<tr>
	<td colspan="2">
	<jsp:include page="layout/top.jsp" flush="false"/>
	</td>
</tr>

<tr height="300">
	<td valign="top" width="100">
	<jsp:include page="layout/left.jsp" flush="false"/>	
	</td>
	
	<td width="300" valign="top">
	메인화면
	</td>
</tr>

<tr>
	<td colspan="2">
	<jsp:include page="layout/bottom.jsp" flush="false"/>
	</td>
</tr>

</table>

</body>
</html>