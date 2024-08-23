package com.kh.chat.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.chat.model.vo.Chat;
import com.kh.chat.model.vo.Friend;
import com.kh.member.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class ChatDao {

	private Properties prop = new Properties();
	
	public ChatDao() {
		String filePath = ChatDao.class.getResource("/db/sql/chat-mapper.xml").getPath(); 
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//	친구 리스트 조회
	public ArrayList<Friend> friendList(Connection conn, int memNo){
		ArrayList<Friend> friend = new ArrayList<Friend>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("friendList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, memNo);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				
				friend.add(new Friend(rset.getInt("sender_no"),
									  rset.getInt("receiver_no"),
									  rset.getInt("mem_no"),
									  rset.getString("nickname"),
									  rset.getString("profile_pic")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return friend;
	}
	
	
	
	
	
	
	
	
	
}
