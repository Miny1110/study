package com.join;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConn;

public class MemberServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		Connection conn = DBConn.getConnection();
		MemberDAO dao = new MemberDAO(conn);
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		
		String url;
		
		if(uri.indexOf("created.do")!=-1) {
			
			url = "/member/created.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("created_ok.do")!=-1) {
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUserId(req.getParameter("userId"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
			
			dao.insertData(dto);
			
			url = cp;
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("login.do")!=-1) {
			
			url = "/member/login.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("login_ok.do")!=-1) {
			
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			
			MemberDTO dto = dao.getReadData(userId);
			//결과는 데이터가 있거나 데이터가 없거나 둘 중 하나

			//로그인 실패
			if(dto==null || !dto.getUserPwd().equals(userPwd)) {
				//dto==null > 아이디가 없다.
				//!dto.getUserPwd().equals(userPwd) > 아이디는 있는데 패스워드가 틀림
			
				req.setAttribute("message", "아이디 또는 패스워드를 정확히 입력하세요");
				
				url = "/member/login.jsp";
				forward(req, resp, url);
				
				return;
			}
			
			
			//로그인 성공
			//세션에 올릴 데이터 객체 생성
			CustomInfo info = new CustomInfo();
			
			//그냥 userId를 적으면 사용자가 잘못 입력한 데이터가 들어갈 수도 있으므로, 검사를 거친 dto의 userId를 받아야 한다.
			info.setUserId(dto.getUserId());
			info.setUserName(dto.getUserName());
			
			//세션 생성
			HttpSession session = req.getSession();
			
			//세션에 customInfo라는 이름으로 id와 name을 담은 info가 올라가게 된다.
			session.setAttribute("customInfo", info);
			
			url = cp;
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("logout.do")!=-1) {
			
			//로그아웃은 세션에 있는거 지우면 된다.
			
			HttpSession session = req.getSession();
			
			session.removeAttribute("customInfo"); //customInfo 안에 있는 info를 삭제
			session.invalidate(); //customInfo를 삭제 (일종의 확인사살)
			
			url = cp;
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("searchpw.do")!=-1) {
			
			url = "/member/searchpw.jsp";
			forward(req, resp, url);
			
			
		}else if(uri.indexOf("searchpw_ok.do")!=-1) {
			
			String userId = req.getParameter("userId");
			String userTel = req.getParameter("userTel");
			
			MemberDTO dto = dao.getReadData(userId);
			
			if(dto==null || !dto.getUserTel().equals(userTel)) {
				
				req.setAttribute("message", "회원정보가 존재하지 않습니다.");
				
				url = "/member/login.jsp";
				forward(req, resp, url);
				
				return;
				
			}
			
			req.setAttribute("message", "비밀번호는 [" + dto.getUserPwd() + "] 입니다.");
			
			url = "/member/login.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("updated.do")!=-1) {
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
			
			MemberDTO dto = dao.getReadData(info.getUserId());
			
			req.setAttribute("dto", dto);
			
			url = "/member/updated.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("updated_ok.do")!=-1) {
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUserId(req.getParameter("userId"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
			
			dao.updateData(dto);
			
			url = cp;
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("idcheck.do")!=-1) {
			String userId = req.getParameter("userId");
			
			int result = dao.getLists(userId);
			
			if(result==1) {
				req.setAttribute("message", "이미 존재하는 아이디입니다.");
				req.setAttribute("userIdChk", userId);
				
			}else {
				req.setAttribute("message", "사용 가능한 아이디입니다.");
				req.setAttribute("userIdChk", userId);
			}
			
			url = "/member/created.jsp";
			forward(req, resp, url);
			
			return;
		}
		
	}
	
	
	
	
	
}
