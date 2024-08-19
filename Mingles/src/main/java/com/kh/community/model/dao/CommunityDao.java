package com.kh.community.model.dao;

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

import static com.kh.common.JDBCTemplate.*;
import com.kh.community.model.vo.Community;

public class CommunityDao {
	
	private Properties prop = new Properties();
	
	public CommunityDao() {
		
		String filePath = CommunityDao.class.getResource("/db/sql/community-mapper.xml").getPath();
		filePath = URLDecoder.decode(filePath, StandardCharsets.UTF_8);
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Community> tagList(Connection conn, int memNo){
		// select문 => resultSet 여러행 => arraylist<community>
			ArrayList<Community> list = new ArrayList<Community>();
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("tagList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memNo);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Community cmt = new Community();
					cmt.setPostNum(rset.getInt("post_num"));
					cmt.setPostTag(rset.getString("post_tag"));
					cmt.setPostWriter(rset.getInt("post_writer"));
					list.add(cmt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
