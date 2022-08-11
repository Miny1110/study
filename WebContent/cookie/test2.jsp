<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//쿠키는 여러개를 만들 수 있어서 배열로 받는다.
	Cookie[] ck = request.getCookies();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	if(ck!=null){
		
		for(Cookie c : ck){
			
			out.print("쿠키이름: ");
			out.print(c.getName() + "<br/>");
			out.print("쿠키값: ");
			
			String str = c.getValue();
			if(c.getName().equals("addr")){
				str = URLDecoder.decode("str","utf-8");
			}
			//test1에서 인코딩 했을 때 필요한 코딩
			
			out.print(c.getValue() + "<br/>");
			
		}
		
	}

%>

</body>
</html>