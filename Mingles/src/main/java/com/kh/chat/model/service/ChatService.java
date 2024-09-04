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
	
	public ArrayList<Chat> chatList(int toNum, int fromNum) {
		Connection conn = getConnection();
		ArrayList<Chat> chatList = new ChatDao().chatList(conn, toNum, fromNum);

		close(conn);
		return chatList;
	}
	
	public int insertChat(Chat c) {
		
		Connection conn = getConnection();
		
		int inChat = new ChatDao().insertChat(conn, c);
		
		if(inChat>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return inChat;
	}
	
	public ArrayList<Friend> searchFriend(int loginMem, String friendKeyword){
		Connection conn = getConnection();
		ArrayList<Friend> searchFriend = new ChatDao().searchFriend(conn, loginMem, friendKeyword);
		
		close(conn);
		return searchFriend;
	}
	
	
	
	
	
	
	
	
	
	
	
}