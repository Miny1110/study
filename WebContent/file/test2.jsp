<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
/*	String subject = request.getParameter("subject");
	String upload = request.getParameter("upload");
	파일은 getParameter로 받을 수 없다. */
	
	String contentType = request.getContentType();
	Enumeration er = request.getHeaderNames();
	//파일은 헤더 부분이 있고 밑에는 데이터가 저장되어 있다.
	
	out.print("전송받은 헤더 정보..<br/>");
	while(er.hasMoreElements()){
		
		String key = (String)er.nextElement();
		String value = request.getHeader(key);
		
		out.print(key + " : " + value + "<br/>");
		
	}
	
	
	out.print("<br/>전송받은 데이터 정보..<br/>");
	DataInputStream is = new DataInputStream(request.getInputStream());
	//스트림을 통해 받아야 한다.
	
	String str;
	
	while((str=is.readLine())!=null){
		
		out.println(new String(str.getBytes("iso-8859-1"),"euc-kr") + "<br/>");
		//파일의 한글 이름은 별도로 주는 인코딩 타입이 있어서 위 코드를 써야 한글이 깨지지 않는다.
			
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 
제목 : <%=subject %><br/>
파일 : <%=upload %><br/> --%>
<!-- 파일 자체가 넘어오는 것이 아니라 파일명만 넘어온다. -->



</body>
</html>