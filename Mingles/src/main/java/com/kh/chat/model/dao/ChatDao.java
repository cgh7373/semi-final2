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
	
	public ArrayList<Friend> friendList(Connection conn, int memNo){
		ArrayList<Friend> friend = new ArrayList<Friend>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("friendList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				
				friend.add(new Friend(rset.getInt("sender_no"),
									  rset.getInt("receiver_no"),
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

	
	public ArrayList<Chat> chatList(Connection conn, String chatTime){
		ArrayList<Chat> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("chatList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chatTime);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Chat chat = new Chat();
				chat.setChatId(rset.getInt("chat_id"));
				chat.setFromNickname(rset.getString("from_nickname"));
				chat.setToNickname(rset.getString("to_nickname"));
				chat.setChatContent(rset.getString("chat-content"));
				chat.setChatTime(rset.getString("chat_time"));
				list.add(chat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int chatSubmit(Connection conn, String fromNickname, String toNickname, String chatContent) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("chatSubmit");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fromNickname);
			pstmt.setString(2, toNickname);
			pstmt.setString(3, chatContent);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}
