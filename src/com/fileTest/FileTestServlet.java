package com.fileTest;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

public class FileTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void forward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		Connection conn = DBConn.getConnection();
		FileTestDAO dao = new FileTestDAO(conn);
		
		String cp = request.getContextPath();
		String uri = request.getRequestURI();
		String url;
		
		//파일 저장 경로 설정
		String root = getServletContext().getRealPath("/");
		String path = root + "pds" + File.separator + "saveFile";
		
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		if(uri.indexOf("write.do")!=-1) {
			
			url = "/fileTest/write.jsp";
			forward(request, response, url);
			
		}else if(uri.indexOf("write_ok.do")!=-1) {
			
			String encType = "utf-8";
			int maxSize = 10*1024*1024;
			
			MultipartRequest mr = new MultipartRequest(request, path, maxSize, encType, 
					new DefaultFileRenamePolicy());
			
			if(mr.getFile("upload")!=null) {
				
				FileTestDTO dto = new FileTestDTO();
				
				int maxNum = dao.getMaxNum();
				
				dto.setNum(maxNum + 1);
				dto.setSubject(mr.getParameter("subject"));
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				dto.setOriginalFileName(mr.getOriginalFileName("upload"));
				
				dao.insertData(dto);
				
			}
			
			url = cp + "/file/list.do";
			response.sendRedirect(url);
			
		}else if(uri.indexOf("list.do")!=-1) {
			
			List<FileTestDTO> lists = dao.getLists();
			
			String downloadPath = cp + "/file/download.do";
			String deletePath = cp + "/file/deleted.do";
			
			String imagePath = cp + "/pds/saveFile";
			//이미지는 실제 주소를 써주어야 한다.
			request.setAttribute("imagePath", imagePath);

			
			request.setAttribute("downloadPath", downloadPath);
			request.setAttribute("deletePath", deletePath);
			request.setAttribute("lists", lists);
			
			url = "/fileTest/list.jsp";
			forward(request, response, url);
			
		}else if(uri.indexOf("download.do")!=-1) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			FileTestDTO dto = dao.getReadData(num);
			
			if(dto==null) {
				return;
			}
			
			boolean flag = FileManager.doFileDownload(response, dto.getSaveFileName(),
					dto.getOriginalFileName(), path);
			//잘 되면 true, 아니면 false
			
			if(flag==false) {
				
				response.setContentType("text/html;charset=utf-8");
				
				PrintWriter out = response.getWriter();
				
				out.print("<script type='text/javascript'>");
				out.print("alert('Download Error!!');");
				out.print("history.back();");
				out.print("</script>");
				
			}
		
		}else if(uri.indexOf("deleted.do")!=-1) {
			//삭제 누르면 1. 파일 지우고 2. DB도 지워야 한다.
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			FileTestDTO dto = dao.getReadData(num);
			
			//파일 삭제
			FileManager.doFileDelete(dto.getSaveFileName(), path);
			
			//DB 파일정보 삭제
			dao.deleteData(num);
			
			url = cp + "/file/list.do";
			response.sendRedirect(url);

		}
		
		
		
		
		
		
		
	}

}




















