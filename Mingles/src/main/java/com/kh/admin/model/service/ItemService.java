package com.kh.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.common.JDBCTemplate.*;

import com.kh.admin.model.dao.ItemDao;
import com.kh.admin.model.vo.Item;

public class ItemService {
	
	public ArrayList<Item> selectItemList(){
		
		Connection conn = getConnection();
		ArrayList<Item> list = new ItemDao().selectItemList(conn);
		
		return list;
	}// selectItemList()
	
	
}
