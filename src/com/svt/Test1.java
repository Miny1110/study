package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Test1 extends GenericServlet{
//Servlet 인터페이스를 상속받은 추상 클래스
//service메소드를 제외한 모든 메소드를 재정의했다.
//GenericServlet를 상속받으면 메소드 재정의 구문을 적용해야 한다.
	
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
	
		res.setContentType("text/html;charset=utf-8");
		
		try {
			
			PrintWriter out = res.getWriter();
			
			out.print("<html>");
			out.print("<head>");
			out.print("<title>");
			out.print("예제 프로그램</title></head>");
			out.print("<body style='font-size:12pt;'>");
			out.print("화면 디자인은 서블릿보다 JSP가 편하다");
			out.print("</body>");
			out.print("</html>");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	
	}

}
