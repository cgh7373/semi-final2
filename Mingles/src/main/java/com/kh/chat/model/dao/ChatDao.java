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
	
//	보낸 친구 정보 저장
	public Friend toMember(Connection conn, int toNo) {
		Friend toMem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("toMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, toNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				toMem = new Friend(rset.getInt(toNo),
								   rset.getString("nickname"),
								   rset.getString("profile_pic"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return toMem;
	}
	
//	채팅내역 검색
	public ArrayList<Chat> selectChat(Connection conn, Chat user) {
		ArrayList<Chat> selectChat = new ArrayList<Chat>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectChat");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user.getFromNo());
			pstmt.setInt(2, user.getToNo());
			pstmt.setInt(3, user.getToNo());
			pstmt.setInt(4, user.getFromNo());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				selectChat.add(new Chat(rset.getInt("chat_id"),
						   				rset.getInt("from_memno"),
						   				rset.getInt("to_memno"),
						   				rset.getString("chat_content"),
						   				rset.getString("chat_time")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}return selectChat;
	}
	
	
	
	
	
	
	
	
}
