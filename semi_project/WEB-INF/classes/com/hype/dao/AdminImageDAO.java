package com.hype.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.hype.dto.ImageDTO;

public class AdminImageDAO {
private BasicDataSource bds;
	
	public AdminImageDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}
	
	public int insert(ImageDTO dto) throws Exception{
		String sql = "insert into tbl_image values(?,?,?)";
		try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(2, dto.getSeq_product());
			pstmt.setString(1, dto.getImage_name());
			pstmt.setString(3, dto.getImage_path());
			
			int rs = pstmt.executeUpdate();
			return rs;
		}
	}
}
