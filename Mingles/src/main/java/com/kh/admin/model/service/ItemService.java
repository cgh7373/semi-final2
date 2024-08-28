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
	
	public int selectListWithCategoryCount(String category) {
		Connection conn = getConnection();
		
		int listcount = new ItemDao().selectListWithCategoryCount(conn, category); 
		
		close(conn);
		return listcount;
	}//selectListWithCategoryCount
	

	public ArrayList<Item> selectListWithCategory(PageInfo pi, String category) {
		
		Connection conn = getConnection();
		ArrayList<Item> list = new ItemDao().selectListWithCategory(conn, pi, category);
		
		close(conn);
		return list;
	}// selectListWithCategory

	public Item purchaseItem( int itemNo, int itemPrice) {
		Connection conn = getConnection();
		Item it = new ItemDao().purchaseItem(conn, itemNo, itemPrice);
		
		close(conn);
		return it;
	}// purchaseItem

	
}
