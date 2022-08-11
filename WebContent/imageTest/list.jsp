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

</head>
<body>

<br/><br/>

<table width="650" cellpadding="0" cellspacing="3" bgcolor="#e4e4e4" style="margin: auto;">
<tr height="40">
	<td bgcolor="#ffffff" style="padding-left: 10px;">
	<b>이미지 게시판</b>
	</td>
</tr>
</table>

<br/><br/>

<table width="650" cellpadding="0" cellspacing="0" style="margin: auto;">
<tr>
	<td align="left">Total ${dataCount } articles, ${totalPage } pages / Now page is ${currentPage }</td>
	<%-- ${}는 서블릿 파일에서 setAttribute로 받아온 데이터들. dto에 저장된 데이터는 아니기 때문에 앞에 객체는 쓰지 않는다. --%>
	<td align="right">
		<input type="button" value="메인화면" onclick="location='<%=cp%>';" class="btn2">
		<input type="button" value="게시물 등록" onclick="location='<%=cp%>/image/write.do';" class="btn2">
	</td>
</tr>

<tr height="2"><td colspan="3" bgcolor="#cccccc"></td></tr>
</table>


<table width="600" cellpadding="0" cellspacing="0" style="margin: auto; table-layout: fixed; border-spacing: 10px 10px;">
		<col width="180"/>
		<col width="180"/>
		<col width="180"/>
<c:forEach var="dto" items="${lists }" varStatus="status">
	<c:if test="${status.count % 3 == 1}">
		<tr>
	</c:if>
	<!-- 개수를 3으로 나눈 나머지가 1이면 tr을 연다. 나머지가 1이라는 것은 해당 줄의 첫번째 데이터라는 말
	나머지가 1이 아니면 tr을 열지 않는다. td만 반복 (=줄바꿈 없이 데이터 넣기만 반복) -->
	
		<td align="center">
		<img src="${imagePath }/${dto.saveFileName}" width="180" height="180"><br/>
		${dto.subject } <a href="${deletePath }?num=${dto.num}&${params}">[삭제]</a>
		<!-- 삭제할 때 삭제하려는 이미지의 num과 params(=pageNum)도 같이 들고간다.
		그래야 delete 후 리다이렉트 할 때 list.do 뒤에 pageNum이 붙을 수 있고, pageNum이 붙어야 리다이렉트를 해도 삭제한 이미지가 있던 페이지를 유지할 수 있다.
		list.do 뒤에 pageNum이 붙지 않으면 리다이렉트할 때 list.do로 리다이렉트를 하게 되고, 그러면 어느 페이지의 이미지를 삭제하더라도 무조건 첫 페이지로 돌아가게 된다. -->
		</td>
		
	<c:if test="${status.count % 3 == 0 }">
		</tr>
	</c:if>
	<!-- 개수를 3으로 나눈 나머지가 0이면 tr을 닫는다. 나머지가 0이라는 것은 해당 줄의 3번째 데이터(마지막 데이터)라는 말
	나머지가 0이 아니면 tr을 닫지 않는다. td만 반복 (=줄바꿈 없이 데이터 넣기만 반복) -->
</c:forEach>
<tr height="2"><td colspan="3" bgcolor="#cccccc"></td></tr>
</table>

<br/>

<table width="700" cellpadding="0" cellspacing="0" style="margin: auto;">
<tr>
	<td align="center">${pageIndexList }</td>
</tr>
</table>

</body>
</html>