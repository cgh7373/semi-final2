package com.kh.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminDao;
import com.kh.admin.model.vo.Blacklist;
import com.kh.admin.model.vo.Item;
import com.kh.admin.model.vo.ItemCategory;

import static com.kh.common.JDBCTemplate.*;

public class AdminService {

	public ArrayList<Blacklist> selectBlacklist() {
		Connection conn = getConnection();
		
		ArrayList<Blacklist> list = new AdminDao().selectBlacklist(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Integer> selectMemberCount() {
		Connection conn = getConnection();
		
		ArrayList<Integer> count = new AdminDao().selectMemberCount(conn);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Item> selectItem() {
		Connection conn = getConnection();
		
		ArrayList<Item> list = new AdminDao().selecItem(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<ItemCategory> selectItemCategory() {
		Connection conn = getConnection();
		
		ArrayList<ItemCategory> itemCategory = new AdminDao().selectItemCategory(conn);
		
		close(conn);
		
		return itemCategory;
	}

}
