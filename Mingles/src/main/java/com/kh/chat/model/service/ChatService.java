package com.kh.chat.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.chat.model.dao.ChatDao;
import com.kh.chat.model.vo.Chat;
import com.kh.chat.model.vo.Friend;
import com.kh.member.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class ChatService {
	
	public ArrayList<Friend> friendList(int memNo) {
		Connection conn = getConnection();
		ArrayList<Friend> friend = new ChatDao().friendList(conn, memNo);
		
		close(conn);
		return friend;
	}
	
	public ArrayList<Chat> chatList(String chatTime){
		Connection conn = getConnection();
		ArrayList<Chat> list = new ChatDao().chatList(conn, chatTime);
		
		close(conn);
		return list;
	}

	public int chatSubmit(String fromNickname, String toNickname, String chatContent) {
		Connection conn = getConnection();
		int result = new ChatDao().chatSubmit(conn, fromNickname, toNickname, chatContent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}