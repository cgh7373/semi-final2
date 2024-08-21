package com.kh.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminDao;
import com.kh.admin.model.vo.Attachment;
import com.kh.admin.model.vo.Blacklist;
import com.kh.admin.model.vo.Item;
import com.kh.admin.model.vo.ItemCategory;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

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

	public ArrayList<Item> choiceCategory(String ic) {
		Connection conn = getConnection();
		
		ArrayList<Item> itemList = new AdminDao().choiceCategory(conn, ic); 
		
		close(conn);
		
		return itemList;
	}

	public int insertItem(Attachment at, Item i) {
		Connection conn = getConnection();
		
		int result1 = new AdminDao().insertItemImg(conn, at);
		
		int result2 = new AdminDao().insertItem(conn, i);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	public ArrayList<Member> selectMemberList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new AdminDao().selectMemberList(conn, pi);
				
		close(conn);
		
		return list;
	}

	public int memberCount() {
		Connection conn = getConnection();
		
		int count = new AdminDao().memberCount(conn);
		
		close(conn);
		
		return count;
	}

	public int insertBlackList(int memNo) {
		Connection conn = getConnection();
		
		int result1 = new AdminDao().insertBlackList(conn, memNo);
		
		int result2 = new AdminDao().updateBlockCount(conn);
				
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	public int deleteItem(int itemNo) {
		Connection conn = getConnection();
		
		int result = new AdminDao().deleteItem(conn, itemNo);
				
		if(result > 0 ) {
			commit(null);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updatePrice(int itemNo, int price) {
		Connection conn = getConnection();
		
		int result = new AdminDao().updatePrice(conn, itemNo, price);
		
		if(result > 0) { 
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateItemImg(Attachment at, int itemNo) {
		Connection conn = getConnection();
		
		int result = new AdminDao().updateItemImg(conn, at, itemNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteImg(String originFileName) {
		Connection conn = getConnection();
		
		int result = new AdminDao().deleteImg(conn, originFileName);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
			
		return 0;
	}

}
