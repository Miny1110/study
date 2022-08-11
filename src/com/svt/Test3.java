package com.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test3 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		//한글처리를 위해서 제일 먼저 써주어야 한다.
	
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		
		//이 파일은 java 파일이라 jsp:usebean 같은 코드는 쓸 수 없다. jsp파일에서만 쓸 수 있다.
		//하나하나 getParameter로 받아야 한다.
		
		String str = name + "의 나이는 " + age + "살 입니다";
		
		req.setAttribute("result", str);
		//result라는 변수를 만들고 그 안에 str을 담은 후에 req에 넣어라.
		//데이터를 담아만 둔 상태. 그 데이터를 옮기기 위한 과정을 포워딩이라고 한다.
		
		
		//포워딩
		RequestDispatcher rd = req.getRequestDispatcher("/servlet/result.jsp");
		//result.jsp한테 데이터 갖다줘
		
		rd.forward(req, resp);
		
		
	}
	
	
}
