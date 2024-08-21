package com.kh.chat.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.chat.model.dao.ChatDao;
import com.kh.chat.model.vo.Chat;
import com.kh.member.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class ChatService {
	
	public ArrayList<Member> allMemberList(){
		Connection conn = getConnection();
		ArrayList<Member> list = new ChatDao().allMemberList(conn);
		
		close(conn);
		return list;
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