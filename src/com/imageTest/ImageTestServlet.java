package com.imageTest;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.FileManager;
import com.util.MyPage;

public class ImageTestServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

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
		ImageTestDAO dao = new ImageTestDAO(conn);
		MyPage myPage = new MyPage();
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;
		
		String root = getServletContext().getRealPath("/");
		//이미지가 저장되는 경로
		String path = root + "pds" + File.separator + "imageFile";
		
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		
		
		if(uri.indexOf("write.do")!=-1) {
			
			url = "/imageTest/write.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("write_ok.do")!=-1) {
			
			String encType = "utf-8";
			int maxSize = 10*1024*1024;
			
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encType, 
					new DefaultFileRenamePolicy());
			
			if(mr.getFile("upload")!=null) {
				
				ImageTestDTO dto = new ImageTestDTO();
				
				int maxNum = dao.getMaxNum();
				
				dto.setNum(maxNum + 1);
				dto.setSubject(mr.getParameter("subject"));
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				dto.setOriginalFileName(mr.getOriginalFileName("upload"));
				
				dao.insertData(dto);
				
			}
			
			url = cp + "/image/list.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("list.do")!=-1) {
			
			//페이지 번호
			String pageNum = req.getParameter("pageNum");
			
			//현재 페이지
			int currentPage = 1;
			
			//페이지번호가 널이 아니면 (=사용자가 페이지 번호를 눌렀으면=페이지를 이동했으면)
			//그 페이지 번호가 현재 페이지가 된다.
			if(pageNum!=null) {
				currentPage = Integer.parseInt(pageNum);
			}else {
				pageNum="1";
			}
			
			//list.do 뒤에 페이지번호 주소를 추가하기 위해 필요한 변수
			String param = "pageNum=" + pageNum;
			
			//데이터의 개수
			int dataCount = dao.getDataCount();
			
			//한 페이지에 나오게 할 데이터 개수
			int numPerPage = 9;
			
			//전체 페이지 수
			int totalPage = myPage.getPageCount(numPerPage, dataCount);
			
			//현재 페이지가 전체 페이지보다 크면
			//전체 페이지가 현재 페이지가 된다.
			//마지막 페이지에 데이터가 하나 남아있는데, 그 데이터를 삭제할 경우 전체 페이지 수를 줄이기 위해서 필요하다.
			//이 코드가 없으면 빈 페이지가 맨 뒤에 남게 된다.
			if(currentPage>totalPage) {
				currentPage = totalPage;
			}
			
			int start = (currentPage-1) * numPerPage +1;
			int end = currentPage * numPerPage;
			
			//getLists 메소드 호출
			//전체 데이터 읽어오기 (데이터 select문 실행)
			List<ImageTestDTO> lists = dao.getLists(start, end);
			
			//가짜주소
			String listUrl = cp + "/image/list.do";
			
			//MyPage 클래스의 페이징 처리 메소드 호출
			//listUrl은 만든 페이징을 뿌릴 값이기 때문에 사용자가 보게 될 주소를 써야됨. 그래서 가짜 주소. 사용자가 보는 주소는 가짜 주소니까
			String pageIndexList = myPage.pageIndexList(currentPage, totalPage, listUrl);
			
			//이미지파일의 폴더 주소
			//list.jsp에서 각 이미지를 불러올 때 주소값이 필요하다.
			String imagePath = cp + "/pds/imageFile";
			String deletePath = cp + "/image/deleted.do";
			
			req.setAttribute("imagePath", imagePath); //이미지 보여줘야 하니까 주소 필요
			req.setAttribute("lists", lists); //리스트목록 뿌려줘야 하니까 필요
			req.setAttribute("pageIndexList", pageIndexList); //밑에 페이지 보여줘야 하니까 필요
			req.setAttribute("dataCount", dataCount); //전체 데이터 개수 필요
			req.setAttribute("totalPage", totalPage); //전체 페이지 필요
			req.setAttribute("currentPage", currentPage); //현재 페이지 필요
			req.setAttribute("deletePath", deletePath); //삭제 주소 필요
			req.setAttribute("params", param); //페이지 번호 주소 필요
			//삭제할 때 삭제하는 이미지의 num과 그 이미지가 있는 pageNum도 같이 넘겨줘야
			//삭제하고 리다이렉트를 했을 때 그 pageNum을 불러와서 list.do 뒤에 붙여줄 수 있다.
			
			//포워드는 진짜 주소
			url = "/imageTest/list.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("deleted.do")!=-1) {
			
			//num과 pageNum을 받아온다. 리다이렉트 주소를 만들기 위해 필요한 값
			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			
			//삭제하려는 데이터의 num을 사용해서 그 하나의 데이터 정보를 읽어온다.
			ImageTestDTO dto = dao.getReadData(num);
			
			//그 데이터의 파일저장명과 동일한 데이터를 삭제한다. (물리적 데이터 삭제)
			FileManager.doFileDelete(dto.getSaveFileName(), path);
			
			//DB 테이블에 저장된 데이터 삭제
			dao.deleteData(num);
			
			//위에서 받아온 pageNum으로 list.do 뒤에 붙여줄 param을 만든다.
			String param = "pageNum=" + pageNum;
			
			//리다이렉트를 하더라도 삭제한 데이터가 있던 페이지를 유지하기 위해서 list.do 뒤에 pageNum 정보를 붙여준다.
			url = cp + "/image/list.do?" + param;
			resp.sendRedirect(url);

		}
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
	
	
	
}
