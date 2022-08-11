<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 

MIME [Multipurpose Internet Mail Extensions]의 종류
메세지의 내용이 어떤 형식인지 알려주기위해 정의한 인터넷 표준

text/plain : 일반 텍스트문서
text/html : HTML 문서 
text/css  :CSS 문서
text/xml : XML 문서
image/jpeg,image/png : JPEG파일, PNG파일 
video/mpeg,audio/mp3 : MPEG 비디오파일, MP3 음악파일
application/zip : zip 압축파일

 -->

<!-- <form action="hap_ok.jsp" method="get"> -->
<form action="hap_ok.jsp" method="post">
<!-- 
script에서 찾아갈 때 이름이 필요한 것이기 때문에 script를 사용하지 않는다면 name을 붙일 이유가 없다.
action : 이 페이지 이후에 넘어갈 다음 페이지를 적어준다.
get 방식 : 데이터를 넘길 때 주소창에 데이터가 다 보인다. 한글 데이터 잘 넘어간다.
post 방식 : 주소창에 데이터를 보여주지 않는다. 한글 데이터는 깨진다.(코딩으로 바꿔주어야 한다 : hap_ok 파일의 jsp 영역에 코딩 있다.)

사용자에게 값을 받아낼 경우에는 일반적으로 post 양식을 사용한다. 보안 중요
프로그래머가 임의이 값을 다른 쪽에 넘겨주고 싶을 때에는 get 방식을 사용한다. 보안 중요 상관없음
 -->
 
 수1: <input type="text" name="su1"/><br/>
 수2: <input type="text" name="su2"/><br/>
 이름: <input type="text" name="name"/><br/>
 <input type="submit" value="결과"/><br/>
<!-- submit : body 안의 action을 찾아간다. 그리고 action에 있는 주소로 넘어간다. --> 

</form>

<!-- 
프로그래머는 get방식을 더 많이 쓴다. 
지금 form은 post 방식이기 때문에 아래 코딩은 form 밖에 작성되어야 한다.
-->

<a href="hap_ok.jsp?su1=100&su2=200&name=도빈">GET방식</a>


</body>
</html>