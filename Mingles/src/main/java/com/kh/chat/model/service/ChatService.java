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
	
	public Friend toMember(int toNo) {
		Connection conn = getConnection();
		Friend toMem = new ChatDao().toMember(conn, toNo);
		
		close(conn);
		return toMem;
	}
	
	public ArrayList<Chat> selectChat(Chat user) {
		Connection conn = getConnection();
		ArrayList<Chat> selectChat = new ChatDao().selectChat(conn, user);

		close(conn);
		return selectChat;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}