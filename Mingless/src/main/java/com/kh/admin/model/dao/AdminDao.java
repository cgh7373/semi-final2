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
	
}
