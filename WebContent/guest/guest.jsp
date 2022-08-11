<%@page import="com.util.MyPage"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.guest.GuestDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.guest.GuestDTO"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Connection conn = DBConn.getConnection();
	GuestDAO dao = new GuestDAO(conn);
	
	MyPage myPage = new MyPage();
	
	String pageNum = request.getParameter("pageNum");
	int currentPage = 1;
	int numPerPage = 4;
	
	if(pageNum!=null){
		currentPage = Integer.parseInt(pageNum);
	}
	
	int dataCount = dao.getDataCount();
	
	
	int totalPage = myPage.getPageCount(numPerPage, dataCount);
	
	if(currentPage>totalPage){
		currentPage = totalPage;
	}
	
 	int start = (currentPage-1)*numPerPage+1;
	int end = currentPage*numPerPage;

	List<GuestDTO> lists = dao.getListData(start, end);
			
	
	String listUrl = "guest.jsp";
	String pageIndexList = myPage.pageIndexList(currentPage, totalPage, listUrl);
	
	DBConn.close();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/guest/data/style.css" />
<script type="text/javascript" src="<%=cp%>/guest/data/guest.js"></script>

<script type="text/javascript">
    function isDelete(num)  {
    	
		if (confirm("위 자료를 삭제하시겠습니까 ?")) {
			location.href="<%=cp%>/guest/delete.jsp?num=" + num;
		}
    }
</script>

</head>
<body>
<table style="margin: auto;"><tr><td>

<br/><br/>

<table width="500" cellpadding="0" cellspacing="3" align="center" bgcolor="#e4e4e4">
<tr height="50">
	<td bgcolor="#ffffff" style="padding-left: 10px;">
	<b>방 명 록 (JSP)</b>
	</td>
</tr>
</table>
<br/><br/>

<form action="" method="post" name="myForm">

<table width="500" cellpadding="0" cellspacing="0" align="center">
<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>


<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">작성자</td>
	<td style="padding-left: 5px;">
	<input type="text" name="name" size="30" maxlength="30" class="boxTF">
	</td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">E-Mail</td>
	<td style="padding-left: 5px;">
	<input type="text" name="email" size="30" maxlength="30" class="boxTF">
	</td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">홈페이지</td>
	<td style="padding-left: 5px;">
	<input type="text" name="homepage" size="30" maxlength="30" class="boxTF" value="http://">
	</td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">내용</td>
	<td style="padding-left: 5px;">
	<textarea rows="12" cols="43" name="content" class="boxTA"></textarea>
	</td>
</tr>

<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>
</table>

<table width="500" cellpadding="0" cellspacing="3" style="padding: auto">
<tr height="35">
	<td align="center" colspan="2">
	<input type="hidden" name="">
	<input type="button" class="btn2" value="등록하기" onclick="sendIt();"/>
	<input type="reset" class="btn2" value="다시입력" onclick="document.myForm.name.focus();">
	</td>
</tr>
</table>

<table width="500" cellpadding="0" cellspacing="0" style="padding: auto">
<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<%if(dataCount==0){ %>
<tr bgcolor="#e6e6e6" height="60px">
	<td colspan="2" align="center"><b>등록된 자료가 없습니다.</b></td>
</tr>
<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>
<% return; }%>

<%for(GuestDTO dto : lists){ 
	dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));%>
<tr bgcolor="#e6e6e6" height="30px">
	<td align="left" style="padding-left: 5px;">
	<b>No&nbsp;<%=dto.getNum() %>.&nbsp;<%=dto.getName() %>(<%=dto.getEmail() %>)</b>
	</td>
	<td align="right" style="padding-right: 5px;">
	<%if(dto.getHomepage()==""){ %>
	<% } else{ %>
	홈페이지&nbsp;:&nbsp;<%=dto.getHomepage() %>
	<%} %>
	</td>
</tr>

<tr bgcolor="#e6e6e6" height="30px">
	<td align="left" style="padding-left: 5px;">
	작성일&nbsp;:&nbsp;<%=dto.getCreated() %>&nbsp;(<%=dto.getIpAddr() %>)
	</td>
	<td align="right" style="padding-right: 5px;">
	<a onclick="isDelete(<%=dto.getNum()%>);">삭제</a>
	</td>
</tr>

<tr height="1">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

<tr height="30px">
	<td style="padding-left: 5px; padding-bottom: 10px; padding-top: 10px;"><%=dto.getContent() %></td>
	
</tr>

<%} %>

<tr height="2">
	<td colspan="2" bgcolor="#cccccc"></td>
</tr>

</table>

<table width="500" cellpadding="0" cellspacing="0" style="padding: auto">
<tr height="30px">
	<td align="center"><%=pageIndexList %> </td>
</tr>
</table>

</form>
</td>
</tr>
</table>
</body>


</html>















