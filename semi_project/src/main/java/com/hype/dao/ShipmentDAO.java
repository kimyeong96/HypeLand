package com.hype.dao;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.hype.dto.BuyDTO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;


public class ShipmentDAO {
	private BasicDataSource bds;

	public ShipmentDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//orderList에 넣을 값 받아오기
	
	//user_id로 seq_order 다 받아오기-> 안씀
	public ArrayList<Integer> SelectSeqOrderbyId(String user_id) throws Exception{
		String sql = "select seq_order from tbl_order where user_id = ? order by 1 desc";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, user_id);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<Integer> list = new ArrayList<>();
			
			while(rs.next()) {
				int seq_order = rs.getInt("seq_order");
				
				list.add(seq_order);
			}
			return list;
		}
	}
	
	//seq_order로 tbl_buy받아오기 -> 안씀
	public ArrayList<BuyDTO> selecttblBuybySeq(int seq_order) throws Exception{ 
		String sql = "select * from tbl_buy where seq_order = ? order by 2 desc";
		
		try(Connection con = bds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setInt(1, seq_order);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<BuyDTO> list = new ArrayList<>();
			
			while(rs.next()) {
				int seq_buy = rs.getInt("seq_buy");
				String buy_name = rs.getString("buy_name");
				int buy_qty  = rs.getInt("buy_qty");
				int buy_price = rs.getInt("buy_price");
				String buy_create = getStringDate(rs.getDate("buy_create"));
				
				list.add(new BuyDTO(seq_buy,seq_order,buy_name,buy_price, buy_qty, buy_create));
			}
			return list;
		}
		
	}
	
	//user_id으로 tbl_buy받아오기
		public ArrayList<BuyDTO> selectTblbuyid(String user_id) throws Exception{ 
			String sql = "select * from tbl_buy where seq_order in(select seq_order from tbl_order where user_id = ?) order by 2 desc";
			
			try(Connection con = bds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
				
				pstmt.setString(1, user_id);
				
				ResultSet rs = pstmt.executeQuery();
				ArrayList<BuyDTO> list = new ArrayList<>();
				
				while(rs.next()) {
					int seq_buy = rs.getInt("seq_buy");
					int seq_order = rs.getInt("seq_order");
					String buy_name = rs.getString("buy_name");
					int buy_qty  = rs.getInt("buy_qty");
					int buy_price = rs.getInt("buy_price");
					String buy_create = getStringDate(rs.getDate("buy_create"));
					
					list.add(new BuyDTO(seq_buy,seq_order,buy_name,buy_price, buy_qty, buy_create));
				}
				return list;
			}
			
		}
	
	
	public String getStringDate(Date date) {
		// 1900-02-02
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	
	
}
