<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.board.BoardDTO"%>
<%@page import="com.board.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	//검색--------------------------------------------------
	
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	if(searchValue!=null){ //검색을 했을 경우
		
		//get방식은 한글을 인코딩해서 보냄
		if(request.getMethod().equalsIgnoreCase("GET")){
		//대소문자를 구분하지 않고(equalsIgnoreCase) get방식으로 오면(getMethod:get인지 post인지 구분)	
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
	} else{
		
		searchKey = "subject";
		searchValue = "";
		
	}
	
	//검색--------------------------------------------------
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	
	//조회수 증가
	dao.updateHitCount(num);
			
	//글 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	//글의 라인 수
	int lineSu = dto.getContent().split("\n").length; //엔터의 개수를 세면 줄 수가 된다.
	
	//엔터를 <br/>로 처리하는 작업
	dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
	//게터로 꺼내와서 <br/>로 바꾼 후에 다시 세터로 넣는다.
	
	//검색
	String param = "";
	if(searchValue!=null && !searchValue.equals("")){
	//자바에서 널 비교할 때 에러가 발생할 수 있기 때문에 확실하게 하기 위해서 두번 검사한다.
		param = "&searchKey=" + searchKey;
		param+= "&searchValue=" + URLEncoder.encode(searchValue,"UTF-8");
	}
	
	DBConn.close();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게 시 판</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/board/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/board/css/article.css"/>

</head>
<body>


<div id="bbs">
	<div id="bbs_title">
	게 시 판
	</div>
	
	<div id="bbsArticle">
		<div id="bbsArticle_header">
		<%=dto.getSubject() %>
		</div>
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd><%=dto.getName() %></dd>				
				<dt>줄수</dt>
				<dd><%=lineSu %></dd>				
			</dl>
		</div>

		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<dd><%=dto.getCreated() %></dd>				
				<dt>조회수</dt>
				<dd><%=dto.getHitCount() %></dd>				
			</dl>
		</div>
		
		<div id="bbsArticle_content">
			<table width="600" border="0">
			<tr>
				<td style="padding: 20px 80px 20px 62px;" valign="top" height="200"> 
				<%=dto.getContent() %>
				</td>
			</tr>
			</table>
		</div>
	</div>
	
	<div class="bbsArticle_noLine" style="text-align: right;">
	From : <%=dto.getIpAddr() %>
	</div>
	
	<div id="bbsArticle_footer">
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2" 
			onclick="location='<%=cp%>/board/updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%><%=param%>';"/>
			<input type="button" value="삭제" class="btn2" onclick="location='<%=cp%>/board/delete_ok.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%><%=param%>';"/>
		</div>
		
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2" 
			onclick="location='<%=cp%>/board/list.jsp?pageNum=<%=pageNum%><%=param%>';"/>
		</div>
	</div>
</div>


</body>
</html>