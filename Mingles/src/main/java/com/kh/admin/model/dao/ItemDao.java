package com.kh.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;

import com.kh.admin.model.vo.Item;
import com.kh.common.model.vo.PageInfo;

public class ItemDao {

	private Properties prop = new Properties();
	
	public ItemDao() {
		String filePath = ItemDao.class.getResource("/db/sql/shop-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}// ItemDao-db연결
	
	
	// category 값을 안받았을 경우 - 전체 select문
	
	public int selectListCount(Connection conn) {
		int listCount =0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectItemListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}// 총 게시글수 출력 메소드 - selectListCount()
	
	// 아이템list 출력
	public ArrayList<Item> selectItemList(Connection conn, PageInfo pi){
		ArrayList<Item> list = new ArrayList<Item>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectItemList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(
						rset.getInt("item_num"),
						rset.getString("categoryname"),
						rset.getString("item_name"),
						rset.getInt("price"),
						rset.getString("item_intro"),
						rset.getDate("item_date"),
						rset.getString("item_status"),
						rset.getString("save_file")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}//selectItemList
	
	
	// category 값을 받았을 경우 - 일부 select문
	
	public int selectListWithCategoryCount(Connection conn, String category) {
		int listCount =0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListWithCategoryCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
				
		return listCount;
	}//selectListWithCategoryCount

	public ArrayList<Item> selectListWithCategory(Connection conn, PageInfo pi, String category) {
		ArrayList<Item> list = new ArrayList<Item>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListWithCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(
						rset.getInt("item_num"),
						rset.getString("categoryname"),
						rset.getString("item_name"),
						rset.getInt("price"),
						rset.getString("item_intro"),
						rset.getDate("item_date"),
						rset.getString("item_status"),
						rset.getString("save_file")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}// selectListWithCategory


	public Item purchaseItem(Connection conn, int itemNo, int itemPrice) {
		Item it = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		String sql = prop.getProperty("purchaseItem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, itemNo);
			pstmt.setInt(2, itemPrice);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				it = new Item(
						rset.getInt("item_num"),
						rset.getString("item_category"),
						rset.getString("item_name"),
						rset.getInt("price"),
						rset.getString("item_intro"),
						rset.getDate("item_date"),
						rset.getString("item_status"),
						rset.getString("save_file")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return it;
	}// purchaseItem


	public int decreaseEgg(Connection conn, int userNo, int price) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("decreaseEgg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, price);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	
}
