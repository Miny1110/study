<%@page import="com.score.ScoreDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.score.ScoreDTO" scope="page"/>
<!-- dto라는 객체가 중복되어도 dto가 이 페이지를 벗어나지 않게 하기 위해서 적어주어야 한다. -->
<jsp:setProperty property="*" name="dto"/>

<%
	Connection conn = DBConn.getConnection();
	ScoreDAO dao = new ScoreDAO(conn);
	
	int result = dao.insertData(dto);
	//insert가 잘 되면 1, 아니면 0이 들어온다.
	
	DBConn.close();
	
	if(result!=0){
		response.sendRedirect("list.jsp");
		//리다이렉트는 insert, update, delete, session이 바뀌었을 때 사용한다.
	}
%>


입력오류
