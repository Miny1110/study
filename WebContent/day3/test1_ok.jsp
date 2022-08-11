<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String name = request.getParameter("name");
	
	request.setAttribute("msg", "물고기선물보냈지");
	
	response.sendRedirect("test1_result.jsp");
	
	//아래 body 부분 출력을 하지 않고 test_result.jsp 파일로 간다.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

이름: <%=name %>

</body>
</html>