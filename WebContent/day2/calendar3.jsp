<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Calendar cal = Calendar.getInstance();
	
	//오늘날짜
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
		
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	

	//달력에 표시할 년,월
	int year = nowYear;
	int month = nowMonth;
	
	if(strYear!=null){
		year = Integer.parseInt(strYear);
	}
	
	if(strMonth!=null){
		month = Integer.parseInt(strMonth);
	}
	
	
	//표시할 달력
	cal.set(year,month-1,1);
	int startDay = 1;
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	//year년 month월 1일의 요일수
	int week = cal.get(Calendar.DAY_OF_WEEK);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>만년달력</title>

<style type="text/css">

body {
	font-size: 10pt;
}

td {
	font-size: 10pt;
}

a {
	text-decoration: none;
	color: blue;
}

</style>

<script type="text/javascript">


	function yearSet() {
		
		var f = document.myForm;
		
		var startYear = <%=year%> - 5;
		
		for(var i=0;i<11;i++){
			f.year[i] = new Option(startYear+i, startYear+i);
			
			if(f.year[i].value == <%=year%>){
				f.year[i].selected = true;
			}
		}
		
		for(var i=0;i<12;i++){
			f.month[i] = new Option(i+1, i+1);
			
			if(f.month[i].value == <%=month%>){
				f.month[i].selected = true;
			}
		}
		
	}
	
	
	function update(){
		
		var f = document.myForm;
		f.submit();
		
	}
		

</script>

</head>
<body onload="yearSet();">

<br/><br/>
<form action="calendar2.jsp?year=<%=year %>&month<%=month %>" name="myForm" method="get">
<table align="center" width="210" cellpadding="2" cellspacing="1">
<tr>
	<td>
	<a href="calendar2.jsp?year=<%=nowYear %>&month=<%=nowMonth %>">
	<img src="./today.PNG" align="right"></a>	
	</td>

	<td align="right">
	<select name="year" onchange="update();"></select>
	년
	</td>

	<td align="left">
	<select name="month" onchange="update();"></select>
	월
	</td>
</tr>
</table>

<table align="center" width="210" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
<tr>
	<td bgcolor="#e6e4e6" align="center"><font color="red">일</font></td>
	<td bgcolor="#e6e4e6" align="center">월</td>
	<td bgcolor="#e6e4e6" align="center">화</td>
	<td bgcolor="#e6e4e6" align="center">수</td>
	<td bgcolor="#e6e4e6" align="center">목</td>
	<td bgcolor="#e6e4e6" align="center">금</td>
	<td bgcolor="#e6e4e6" align="center"><font color="blue">토</font></td>
</tr>

<%
	int newLine = 0;
	
	out.print("<tr height='20'>");

	for(int i=1;i<week;i++){
		out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
		newLine++;
	}
	
	for(int i=startDay;i<=endDay;i++){
		String fontColor = (newLine==0)?"red":(newLine==6)?"blue":"black";
		String bgColor = (nowYear==year)&&(nowMonth==month)&&(nowDay==i)?"#e6e4e6":"#ffffff";
		
		out.print("<td align='center' bgcolor='" + bgColor + "'><font color='" + fontColor + "'>" + i + "</font></td>");
		//<td align='center' bgColor='#e6e4e6'><font color='black'>18</font></td>
		
		newLine++;
		
		if(newLine==7&&i!=endDay){
			out.print("</tr><tr height='20'>");
			newLine = 0;
		}
		
	}
	
	while(newLine>0&&newLine<7){
		out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
		newLine++;
	}
	
	out.print("</tr>");
%>

</table>
</form>
</body>
</html>