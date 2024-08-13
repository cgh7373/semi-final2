package com.kh.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.model.vo.Blacklist;
import com.kh.admin.model.vo.Item;
import com.kh.admin.model.vo.ItemCategory;

import static com.kh.common.JDBCTemplate.*;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		
		String filePath = AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath();
		filePath = URLDecoder.decode(filePath, StandardCharsets.UTF_8);
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Blacklist> selectBlacklist(Connection conn) {
		ArrayList<Blacklist> list = new ArrayList<Blacklist>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBlacklist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Blacklist(rset.getString("mem_id"),
									   rset.getString("nickname"),
									   rset.getString("block_type"),
									   rset.getInt("block_count"),
									   rset.getString("report_id"),
									   rset.getDate("block_date")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Integer> selectMemberCount(Connection conn) {
		ArrayList<Integer> count = new ArrayList<Integer>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=1; i<13; i++) {
				pstmt.setInt(1, i);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					count.add((rset.getInt("count")));
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
		
	}

	public ArrayList<Item> selecItem(Connection conn) {
		ArrayList<Item> list = new ArrayList<Item>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectItem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(rset.getInt("item_num")
								, rset.getString("categoryname")
								, rset.getString("item_name")
								, rset.getInt("price")
								, rset.getString("item_intro")
								, rset.getDate("item_date")
								, rset.getString("item_status")
								));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<ItemCategory> selectItemCategory(Connection conn) {
		ArrayList<ItemCategory> itemCategory = new ArrayList<ItemCategory>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectItemCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				itemCategory.add(new ItemCategory(rset.getString("item_category")
												, rset.getString("categoryname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return itemCategory;
	}
	
}
