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

public class ItemDao {

	private Properties prop = new Properties();
	public ItemDao() {
		String filePath = ItemDao.class.getResource("db/sql/Item-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}// ItemDao-db연결
	
	public ArrayList<Item> selectItemList(Connection conn){
		ArrayList<Item> list = new ArrayList<Item>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectItemList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(
						rset.getInt("item_num"),
						rset.getString("item_category"),
						rset.getString("item_name"),
						rset.getInt("price"),
						rset.getString("item_intro"),
						rset.getDate("item_date"),
						rset.getDate("item_update"),
						rset.getString("item_status"),
						rset.getString("attachment_no")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(list);
		return list;
	}
	
}
