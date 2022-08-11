package com.naver;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class NaverDAO {

	private Connection conn;
	
	public NaverDAO(Connection conn) {
		this.conn = conn;
	}
	
	
	//회원가입
	public int insertData(NaverDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into naver (userId,userPwd,birthYear,birthMonth,birthDay,gender,email,tel) ";
			sql+= "values(?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getBirthYear());
			pstmt.setString(4, dto.getBirthMonth());
			pstmt.setString(5, dto.getBirthDay());
			pstmt.setString(6, dto.getGender());
			pstmt.setString(7, dto.getEmail());
			pstmt.setString(8, dto.getTel());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	
	//전체데이터
	public List<NaverDTO> getList(){
		
		List<NaverDTO> lists = new ArrayList<NaverDTO>();
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		
		try {
			
			sql = "select userId,userPwd,birthYear,birthMonth,birthDay,gender,email,tel ";
			sql+= "from naver";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				NaverDTO dto = new NaverDTO();
				
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setBirthYear(rs.getString("birthYear"));
				dto.setBirthMonth(rs.getString("birthMonth"));
				dto.setBirthDay(rs.getString("birthDay"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				
				lists.add(dto);
				
			}
			
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
		
	}
	
	
	//수정할 정보 읽어오기
	public NaverDTO getReadData(String userId) {
		
		NaverDTO dto = null;
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		
		try {
			
			sql = "select userId,userPwd,birthYear,birthMonth,birthDay,gender,email,tel ";
			sql+= "from naver where userId=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new NaverDTO();
				
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setBirthYear(rs.getString("birthYear"));
				dto.setBirthMonth(rs.getString("birthMonth"));
				dto.setBirthDay(rs.getString("birthDay"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
		
	}
	
	
	//정보수정
	public int updateData(NaverDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update naver set userPwd=?,email=?,tel=? ";
			sql+= "where userId=?";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUserPwd());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getTel());
			pstmt.setString(4, dto.getUserId());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	
	//정보삭제
	public int deleteData(String userId) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "delete naver where userId=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
		
	}
	
}
