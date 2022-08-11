<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript">

	function sendIt() {
		
		var f = document.myForm;
		
		if(!f.userId.value){
			alert("아이디를 입력하세요!");
			f.userId.focus();
			return;
		}

		if(!f.userPwd.value){
			alert("패스워드 입력하세요!");
			f.userPwd.focus();
			return;
		}
		
		if(!f.userName.value){
			alert("이름을 입력하세요!");
			f.userName.focus();
			return;
		}
		
		f.action = "<%=cp %>/day1/test2_ok.jsp";
		f.submit();

	}
	
	
	function onlyNum() {
		if(event.keyCode<48||event.keyCode>57){
			event.returnValue = false;
		}
	}
	
	function onlyHangul() {
		if(event.keyCode<12592||event.keyCode>12687){
			event.returnValue = false;
		}
	}
	
	

</script>
</head>
<body>

<form action="" method="post" name="myForm">

아이디: <input type="text" name="userId"><br/>

패스워드: <input type="password" name="userPwd"><br/>

이름: <input type="text" name="userName" onkeypress="onlyHangul();"><br/>

성별:
<input type="radio" name="gender" value="M" checked="checked">남자
<input type="radio" name="gender" value="F">여자<br/>

전화:
<select name="tel1">
	<option value="">선택</option>
	<option value="010" selected="selected">010</option>
	<option value="070">070</option>
	<option value="011">011</option>
</select>
<input type="text" name="tel2" onkeypress="onlyNum();">
-

<input type="text" name="tel3" onkeypress="onlyNum();"><br/>

취미:<br/>
<select multiple="multiple" size="4" name="hobby">
	<option value="여행">여행</option>
	<option value="영화">영화</option>
	<option value="음악">음악</option>
	<option value="게임">게임</option>
</select><br/>

동의합니까?<input type="checkbox" name="agreeChk" value="Y"><br/>

메모:<br/>
<textarea rows="5" cols="20" name="memo"></textarea><br/>

<input type="button" value="회원가입" onclick="sendIt();">
<input type="reset" value="다시입력" onclick="document.myForm.userId.focus();">
	<!-- reset: form 안의 모든 value값들이 초기화된다. -->
<input type="button" value="취소" onclick="javascript:location.href='http://localhost:8080/study/index.jsp'">
<input type="button" value="취소2" onclick="javascript:location.href='<%=cp %>/index.jsp'">

</form>

</body>
</html>