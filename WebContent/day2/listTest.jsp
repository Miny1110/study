<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	font-size: 10pt;
}

.itemBtn {
	font-size: 10pt;
	color: rgb(0,0,0);
	background-color: rgb(240,240,240);
	width: 30pt;
}

.btn {
	font-size: 10pt;
	color: rgb(0,0,0);
	background-color: rgb(240,240,240);
}

.itemList {
	font-size: 10pt;
	width: 100pt;
}

</style>

<script type="text/javascript">

	function itemAdd() {
		
		var f = document.myForm;
		var leftItem = f.leftItem;
		
		leftItem[0] = new Option('배수지','배수지');//html을 객체로 만드는 방법. 돔객체
		leftItem[1] = new Option('유인나','유인나');
		leftItem[2] = new Option('정인아','정인아');
		leftItem[3] = new Option('정인선','정인선');
		leftItem[4] = new Option('강아랑','강아랑');
		leftItem[5] = new Option('우영우','우영우');
		leftItem[6] = new Option('박은빈','박은빈');
		//첫번째 값이 텍스트 데이터, 두번째 값이 value값
		
	}
	
	function itemMove(val) {
		
		var f = document.myForm;
		var source, target;
	
		if(val=="left"){
			source = f.rightItem;
			target = f.leftItem;
		}else{
			source = f.leftItem;
			target = f.rightItem;
		}
		
		var n, i;
		
		n = target.length;
		for(i=source.length-1;i>=0;i--){
			if(source.options[i].selected){
				target[n++] = new Option(source.options[i].text,source.options[i].value);
				source[i] = null;
			}
			
		}
		
	}
	
	function sendIt() {
		
		var f = document.myForm;
		
		if(f.rightItem.length==0){
			alert("쪽지를 보낼 사람을 선택하세요!");
			f.leftItem.focus();
			return;
		}
		
		if(!f.msg.value){
			alert("메세지를 입력하세요!");
			f.msg.focust();
			return;
		}
		
		for(i=0;i<f.rightItem.length;i++){
			f.rightItem[i].selected = true;
			//f.rightItem.options[i].selected = true;
			//둘이 똑같은 코드
		}
		
		f.submit();
		
	}

</script>

</head>
<body onload="itemAdd();">
<br/><br/>

<form action="listTest_ok.jsp" method="post" name="myForm">

<table style="font-size: 10pt"> 

<tr align="center">
	<td width="150">전체리스트</td>
	<td width="70">&nbsp;</td>
	<td width="150">받는사람</td>
</tr>

<tr align="center">
	<td width="150">
		<select name="leftItem" multiple="multiple" size="7" class="itemList">
			<!-- <option value="또볶이">또볶이</option> -->
		</select>
	</td>
	<td width="70">
		<input type="button" value="&gt;" class="itemBtn" onclick="itemMove('right')"><br/>
		<input type="button" value="&lt;" class="itemBtn" onclick="itemMove('left')"><br/>
	</td>
	<td width="150">
		<select name="rightItem" multiple="multiple" size="7" class="itemList">
		</select>
	</td>
</tr>

<tr>
	<td colspan="3">
	<br/>메세지<br/>
	<textarea rows="5" cols="52" name="msg"></textarea>
	</td>
</tr>

<tr>
	<td colspan="3" align="center">
	<input type="button" value="쪽지보내기" class="btn" onclick="sendIt();"><br/>
	</td>
</tr>

</table>

</form>





</body>
</html>