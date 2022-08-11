<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>네이버 : 회원가입</title>
<style type="text/css">

table {
	font-family: 돋움;
	font-size: 15px;
	font-weight: bold;
	width: 450px;
}

input{
	border: 1px solid #c8c8c8;
	width: 450px;
	height: 50px;
}

input.birBox {
	border: 1px solid #c8c8c8;
	width: 140px;
	height: 50px;
}

td.birTd{
	width: 140px;
	height: 50px;	
}

input.pBox{
	border: 1px solid #c8c8c8;
	width: 290px;
	height: 50px;
}

select{
	border: 1px solid #c8c8c8;
	width: 456px;
	height: 50px;
}

</style>

<script type="text/javascript">

	function phone() {
		
		var f = document.myForm;
		
			if(f.tel.value){
				alert("인증번호가 전송되었습니다.");
				return;
			}else{
				alert("전화번호를 입력해주세요.");
			}
			
	}
	
	function join() {
		
		var f = document.myForm;
		
			if(f.userId.value && f.userPwd.value && f.userPwd2.value && f.birthYear.value && f.birthMonth.value && f.birthDay.value && f.email.value && f.tel.value && f.telChk.value){
				alert("회원가입이 완료되었습니다.");
				f.submit();
			}else{
				alert("내용을 입력해주세요.");
			}
	}
	
	function set() {
		
		var f = document.myForm;
		
		for(var i=0;i<12;i++){
			if(i==0){
				f.birthMonth[i] = new Option("월", "월");
			}else{
				f.birthMonth[i] = new Option(i, i);
			}
		}
	}

</script>


</head>


<body bgcolor="#F9F9F9" onload="set();">

<form action="naver_ok.jsp" name="myForm">
<table align="center" cellpadding="5px">

<tr>
<td colspan="3" align="center" style="height: 80px;"><a href="https://www.naver.com/" target="_blank"><img src="naverLogo.jpg"></a></td>
</tr>

<tr>
<td colspan="3" style="height: 30px;">아이디</td>
</tr>

<tr>
<td colspan="3"><input type="text" name="userId"></td>
</tr>

<tr>
<td colspan="3" style="height: 30px;">비밀번호</td>
</tr>

<tr>
<td colspan="3"><input type="password" class="box" name="userPwd"></td>
</tr>

<tr>
<td colspan="3" style="height: 30px;">비밀번호 재확인</td>
</tr>

<tr>
<td colspan="3"><input type="password" class="box" name="userPwd2"></td>
</tr>

<tr>
<td colspan="3" style="height: 30px;">생년월일</td>
</tr>
	
<tr>
<td class="birTd"><input type="text" class="birBox" name="birthYear"></td>

<td class="birTd" align="center">
<select style="width: 140px; height: 54px;" name="birthMonth">

</select>
</td>

<td class="birTd" align="right"><input type="text" class="birBox" name="birthDay"></td>
</tr>	
	
<tr>
<td colspan="3" style="height: 30px;">성별</td>
</tr>	

<tr >
<td colspan="3">
<select name="gender">
<option value="성별">성별</option>
<option value="남자">남자</option>
<option value="여자">여자</option>
<option value="선택안함">선택안함</option>
</select>
</td>
</tr>		

<tr>
<td colspan="3" style="height: 30px;">본인 확인 이메일<font color="gray" style="font-size: 7pt; font-weight: normal;" >(선택)</font></td>
</tr>	

<tr>
<td colspan="3"><input type="text" class="box" name="email"></td>
</tr>

<tr>
<td colspan="3" style="height: 30px;">휴대전화</td>
</tr>

<tr>
<td colspan="3">
<select name="telNation">
<option value="대한민국 +82">대한민국 +82</option>
<option value="가나 +233">가나 +233</option>
<option value="룩셈부르크 +352">룩셈부르크 +352</option>
</select>
</td>
</tr>	

<tr>
<td colspan="2"><input type="text" name="tel" class="pBox"></td>
<td><a href="javascript:phone();"><img src="phone.jpg" style="height: 50px;" align="right"></a></td>
</tr>

<tr>
<td colspan="3"><input type="text" class="box" name="telChk"></td>
</tr>

<tr>
<td colspan="3"><img src="join.jpg" width="456px" onclick="join();"></td>
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