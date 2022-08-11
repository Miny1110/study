<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String uri = request.getRequestURI();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

cp : <%=cp%><br/>
uri : <%=uri %><br/>
<hr/>

<form action="" method="post">
수1 : <input type="text" name="su1"><br/>
수2 : <input type="text" name="su2"><br/>
<input type="submit" value="결과"><br/>
</form>

<br/>

<c:if test="${!empty param.su1 }">
	<c:set var="result" value="1"/>
	<!-- c:set은 변수를초기화한다. -->
		<c:forEach var="i" begin="1" end="${param.su2 }" step="1">
			<c:set var="result" value="${result * param.su1 }" />
			${param.su1 } * ${i } = ${result }<br/>
		</c:forEach>
</c:if>

<c:if test="${!empty param.su1 }">
	<c:choose>
		<c:when test="${param.su1%3==0 && param.su1%4==0 }">
		${param.su1 }은 3과 4의 배수<br/>
		</c:when>

		<c:when test="${param.su1%4==0 }">
		${param.su1 }은 4의 배수<br/>
		</c:when>

		<c:when test="${param.su1%3==0 }">
		${param.su1 }은 3의 배수<br/>
		</c:when>

		<c:otherwise>
			${param.su1 }은 3 또는 4의 배수가 아님
		</c:otherwise>
	</c:choose>
</c:if>

<hr/>

<c:set var="url" value="gugudan.jsp"/>
<c:import url="${url }" var="gu">

	<c:param name="dan" value="5"/>
</c:import>
<c:out value="${gu }" escapeXml="false"/>

<hr/>

<%-- <c:set var="url" value="https://www.daum.net"/>
<c:import url="${url }" var="daum"/>
<c:out value="${daum }" escapeXml="false"/> --%>

</body>
</html>