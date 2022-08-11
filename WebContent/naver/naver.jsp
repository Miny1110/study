<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>네이버 : 회원가입</title>

<script type="text/javascript">

	function phone() {
		
		var f = document.myForm;
		
			if(f.pNum1.value){
				alert("인증번호가 전송되었습니다.");
				return;
			}else{
				alert("전화번호를 입력해주세요.");
			}
			
	}
	
	function join() {
		
		var f = document.myForm;
		
			if(f.id.value && f.pw.value && f.pw2.value && f.bir1.value && f.bir2.value && f.email.value && f.pNum1.value && f.pNum2.value){
				alert("회원가입이 완료되었습니다.");
				return;
			}else{
				alert("내용을 입력해주세요.");
			}
	}

</script>

</head>


<body bgcolor="#F9F9F9">

<form action="" name="myForm">
<table style="width: 500px; font-family: 돋움; font-size: 11pt; font-weight: bold;" align="center">

<tr>
<td colspan="3" align="center" style="height: 80px;"><a href="https://www.naver.com/" target="_blank"><img src="naverLogo.jpg"></a></td>
</tr>

<tr>
<td colspan="3" style="height: 30px;">아이디</td>
</tr>

<tr>
<td colspan="3"><input type="text" style="width: 520px; height: 40px;" name="id"></td>
</tr>

<tr>
<td colspan="3" style="height: 30px;">비밀번호</td>
</tr>

<tr>
<td colspan="3"><input type="password" style="width: 520px; height: 40px;" name="pw"></td>
</tr>

<tr>
<td colspan="3" style="height: 30px;">비밀번호 재확인</td>
</tr>

<tr>
<td colspan="3"><input type="password" style="width: 520px; height: 40px;" name="pw2"></td>
</tr>

<tr>
<td colspan="3" style="height: 30px;">생년월일</td>
</tr>
	
<tr>
<td style="width: 200px; height: 40px;"><input type="text" style="width: 200px; height: 40px;" name="bir1"></td>

<td style="width: 100px; height: 40px;">
<select style="width: 100px; height: 45px;">
<option>월</option>
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<option>6</option>
<option>7</option>
<option>8</option>
<option>9</option>
<option>10</option>
<option>11</option>
<option>12</option>
</select>
</td>

<td style="width: 200px; height: 40px;"><input type="text" style="width: 200px; height: 40px;" name="bir2"></td>
</tr>	
	
<tr>
<td colspan="3" style="height: 30px;">성별</td>
</tr>	

<tr >
<td colspan="3">
<select style="width: 527px; height: 40px;">
<option>성별</option>
<option>남자</option>
<option>여자</option>
<option>선택안함</option>
</select>
</td>
</tr>		

<tr>
<td colspan="3" style="height: 30px;">본인 확인 이메일<font color="gray" style="font-size: 7pt; font-weight: normal;" >(선택)</font></td>
</tr>	

<tr>
<td colspan="3"><input type="text" style="width: 520px; height: 40px;" name="email"></td>
</tr>

<tr>
<td colspan="3" style="height: 30px;">휴대전화</td>
</tr>

<tr>
<td colspan="3">
<select style="width: 527px; height: 40px;">
<option>대한민국 +82</option>
<option>가나 +233</option>
<option>룩셈부르크 +352</option>
</select>
</td>
</tr>	

<tr>
<td colspan="2" style="width: 300px; height: 40px;"><input type="text" style="width: 305px; height: 40px;" name="pNum1"></td>
<td><a href="javascript:phone();"><img src="phone.jpg" style="height: 45px;" align="right"></a></td>
</tr>

<tr>
<td colspan="3"><input type="text" style="width: 520px; height: 40px;" name="pNum2"></td>
</tr>

<tr>
<td colspan="3"><a href="javascript:join();"><img src="join.jpg" style="width: 527px; height: 60px;"></a></td>
</tr>

<tr>
<td colspan="3" align="center" style="height: 50px; font-size: 12px;">
	<a href="https://policy.naver.com/rules/service.html" target="_blank">
	이용약관</a> | 
	<a href="https://policy.naver.com/policy/privacy.html" target="_blank">
	개인정보처리방침</a> |
	<a href="https://policy.naver.com/rules/disclaimer.html" target="_blank">
	책임의 한계와 법적고지</a> | 
	<a href="https://help.naver.com/support/service/main.help?serviceNo=532&_membership_p.membership_p.membership_26&from=alias" target="_blank">
	회원정보 고객센터</a>
</td>
</tr>

</table>
</form>
</body>
</html>