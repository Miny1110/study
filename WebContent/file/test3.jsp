<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//저장 위치 설정
	String root = getServletContext().getRealPath("/");
	//pageContext는 생략해도 된다.
	//String root = pageContext.getServletContext().getRealPath("/");
	
	//String root = request.getRealPath("/");
	//이건 옛날 방식. 요즘은 위 코드처럼 사용한다.
	
	String path = root + "pds" + File.separator + "saveData";
	//File.separator : (=\) 역슬래쉬를 코딩으로 작성하는 방법
	
	
	//폴더 생성
	File f = new File(path);
	
	if(!f.exists()){
		f.mkdirs();
		//폴더가 없으면 만들어라
	}
	
	String encType = "utf-8";
	int maxFileSize = 10*1024*1024; // =10MB
	
	try{
		//파일 전송
		MultipartRequest mr = new MultipartRequest(request,path,maxFileSize,
				encType,new DefaultFileRenamePolicy());
		//파일은 request에 담겨서 오고 path에 저장한다.
		//한번에 올릴 수 있는 사이즈는 maxFileSize, 타입은 encType
		
		
		//DB에 저장할 데이터 추출
		out.print("이름: " + mr.getParameter("subject") + "<br/>");
		
		//올라가서 실제로 저장된 이름
		out.print("서버에 저장된 파일명: " + mr.getFilesystemName("upload") + "<br/>");
		
		//파일의 실제 이름
		out.print("업로드한 파일명: " + mr.getOriginalFileName("upload") + "<br/>");
		
		out.print("파일타입: " + mr.getContentType("upload") + "<br/>");
		
		File f1 = mr.getFile("upload");
		out.print("파일길이: " + f1.length() + "<br/>");
		
		
	}catch(Exception e){
		System.out.print(e.toString());
		
		
	}
	
	
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>