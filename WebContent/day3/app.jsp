<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int n = 0;
	String count = (String)application.getAttribute("count");
	
	if(count!=null){
		n = Integer.parseInt(count);
	}
	n++;
	
	application.setAttribute("count", Integer.toString(n));
	
	String realPath = application.getRealPath("/");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

총 접속자: <%=n %>명<br/>
웹 실제 접속 경로: <%=realPath %><br/>

</body>
</html>