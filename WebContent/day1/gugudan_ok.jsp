<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int dan = Integer.parseInt(request.getParameter("dan"));
	
	String str="";
	for(int i=1;i<=9;i++){
		str += String.format("%d*%d=%d<br/>", dan, i, dan*i);
		//결과를 누적시켜야 한다.
		//밑에서 쓴 for문은 출력을 반복하지만, 이 코드는 밑에서 한번만 출력하기 때문에 값을 누적해주어야 한다.
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

<%=str %>


<%

//	for(int i=1;i<=9;i++){
//		String str = String.format("%d*%d=%d<br/>", dan, i, dan*i);
//		out.print(str);
//	}

%>

</body>
</html>