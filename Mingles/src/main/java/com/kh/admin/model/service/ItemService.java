package com.kh.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.common.JDBCTemplate.*;

import com.kh.admin.model.dao.ItemDao;
import com.kh.admin.model.vo.Item;
import com.kh.common.model.vo.PageInfo;

public class ItemService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new ItemDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}// 총 게시글수 메소드 - selectListCount()
	
	public ArrayList<Item> selectItemList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Item> list = new ItemDao().selectItemList(conn, pi);
		
		
		close(conn);
		return list;
	}// selectItemList()
	
	
}
