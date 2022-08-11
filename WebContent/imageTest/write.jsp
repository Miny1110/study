<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 게시판</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/imageTest/data/style.css">
<script type="text/javascript" src="<%=cp%>/imageTest/data/image.js"></script>


</head>
<body>

<br/><br/>

<table width="700" cellpadding="0" cellspacing="3" bgcolor="#e4e4e4" style="margin: auto;">
<tr height="40">
	<td bgcolor="#ffffff" style="padding-left: 10px;">
	<b>이미지 게시판</b>
	</td>
</tr>
</table>

<br/><br/>

<form action="" name="myForm" method="post" enctype="multipart/form-data">
<table width="700" cellpadding="0" cellspacing="0" style="margin: auto;">
<tr height="2"><td colspan="2" bgcolor="#cccccc"></td></tr>

<tr height="25">
	<td width="80" bgcolor="#e6e4e6" align="center">제목</td>
	<td width="120" style="padding-left: 5px;">
		<input type="text" name="subject">
	</td>
</tr>

<tr height="2"><td colspan="2" bgcolor="#cccccc"></td></tr>

<tr height="25">
	<td width="80" bgcolor="#e6e4e6" align="center">파일</td>
	<td width="120" style="padding-left: 5px;">
		<input type="file" name="upload">
	</td>
</tr>

<tr height="2"><td colspan="2" bgcolor="#cccccc"></td></tr>


<tr height="30">
	<td colspan="2" align="center">
		<input type="button" value=" 등록하기 " class="btn2" onclick="sendIt();">
		<input type="reset" value=" 다시입력 " class="btn2" onclick="document.myForm.subject.focus();">
		<input type="button" value=" 작성취소" class="btn2" onclick="location='<%=cp%>/image/list.do';">
	</td>
</tr>
</table>

</form>

</body>
</html>