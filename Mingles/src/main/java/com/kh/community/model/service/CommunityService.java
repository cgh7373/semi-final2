package com.kh.community.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;
import com.kh.community.model.dao.CommunityDao;
import com.kh.community.model.vo.Community;

public class CommunityService {
	
	public ArrayList<Community> tagList(int memNo){
		Connection conn = getConnection();		
		ArrayList<Community> list = new CommunityDao().tagList(conn, memNo);
		close(conn);
		return list;
	}
	
	

}
