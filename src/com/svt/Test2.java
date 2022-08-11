package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test2 extends HttpServlet{
//HttpServlet에는 웹상에서 클라이언트 요청이 있을 때 해당 서블릿을 실행하는 모든 조건이 포함되어 있다. 
//HttpServlet를 상속받지 않은 클래스는 서블릿이라 할 수 없고, 클라이언트가 실행을 요청해도 실행되지 않는다.
//반드시 상속받아야 한다. 모든 서블릿 클래스의 상위 클래스는 HttpServlet이어야 한다.
//GenericServlet를 상속받은 클래스
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get방식으로 데이터를 보낼 때 처리할 코딩을 작성
		//html 내 form 태그의 method 속성이 get 방식일 때 호출
		
		
/*		//1. ServletConfig 인터페이스 
		ServletConfig config = getServletConfig();
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		
		//2. ServletContext 인터페이스
		ServletContext context = getServletContext();
		String gender = context.getInitParameter("gender");
		
		
		resp.setContentType("text/html;charset=utf-8");
		//이 코드를 작성하지 않으면 받는 파일이 어떤 파일인지 모른다.		
		
		PrintWriter out = resp.getWriter();
		
		out.print("<html><body>");
		out.print("name: " + name + "<br/>");
		out.print("age: " + age + "<br/>");
		out.print("gender: " + gender + "<br/>");
		out.print("</body></html>");*/
		
		
		
		doPost(req, resp);
/*		코딩은 한 곳에 하고 한쪽에는 다른 쪽으로 넘어가게 토스해주는 코딩을 적어준다.
		get, post 어느방식으로 오건 상관없이 받을 수 있게 코딩을 한쪽 메소드에에 입력해 놓은 후,
		비어있는 메소드에는 토스하는 코딩을 넣어 놓으면 값이 어느곳에 위치하던 원하는대로 출력이 된다.
		매개변수까지 같이 입력해줘야 값이 제대로 들어가서 출력이된다.	*/
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//post방식으로 데이터를 보낼 때 처리할 코딩을 작성
		//html 내 form 태그의 method 속성이 post 방식일 때 호출
		
		
		//1. ServletConfig 인터페이스 
		ServletConfig config = getServletConfig();
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		
		//2. ServletContext 인터페이스
		ServletContext context = getServletContext();
		String gender = context.getInitParameter("gender");
		
		
		resp.setContentType("text/html;charset=utf-8");
		//이 코드를 작성하지 않으면 받는 파일이 어떤 파일인지 모른다.		
		
		PrintWriter out = resp.getWriter();
		
		out.print("<html><body>");
		out.print("name: " + name + "<br/>");
		out.print("age: " + age + "<br/>");
		out.print("gender: " + gender + "<br/>");
		out.print("</body></html>");
		
	}
	
	
}
