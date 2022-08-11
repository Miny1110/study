<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게 시 판</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/boardTest/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/boardTest/css/article.css"/>

</head>
<body>


<div id="bbs">
	<div id="bbs_title">
	게 시 판
	</div>
	
	<div id="bbsArticle">
		<div id="bbsArticle_header">
		${dto.subject }
		</div>
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd>${dto.name }</dd>				
				<dt>줄수</dt>
				<dd>${lineSu }</dd>
				<!-- lineSu는 dto에 저장된 것이 아니라 list에서 선언한 변수이기 때문에 그냥 lineSu로 적는다. -->		
			</dl>
		</div>

		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<dd>${dto.created }</dd>				
				<dt>조회수</dt>
				<dd>${dto.hitCount }</dd>				
			</dl>
		</div>
		
		<div id="bbsArticle_content">
			<table width="600" border="0">
			<tr>
				<td style="padding: 20px 80px 20px 62px;" valign="top" height="200"> 
				${dto.content }
				</td>
			</tr>
			</table>
		</div>
	</div>
	
	<div class="bbsArticle_noLine" style="text-align: right;">
	From : ${dto.ipAddr}
	</div>
	
	<div id="bbsArticle_footer">
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2" onclick="location='<%=cp%>/bbs/updated.do?num=${dto.num}&${params }';"/>
			<input type="button" value="삭제" class="btn2" onclick="location='<%=cp%>/bbs/delete_ok.do?num=${dto.num}&${params }';"/>
		</div>
		
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2" onclick="location='<%=cp%>/bbs/list.do?${params }';"/>
		</div>
	</div>
</div>


</body>
</html>