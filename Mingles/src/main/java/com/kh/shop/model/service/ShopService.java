package com.kh.shop.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.shop.model.dao.ShopDao;
import com.kh.shop.model.vo.EggPayMent;

import static com.kh.common.JDBCTemplate.*;

public class ShopService {
	
	public int selectListCount(int userNo) {
		Connection conn = getConnection();
		int listCount = new ShopDao().selectListCount(conn, userNo);
		close(conn);
		return listCount;
	}
	
	public ArrayList<EggPayMent> selectList(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		ArrayList<EggPayMent> list = new ShopDao().selectList(conn, pi, userNo);
		
		close(conn);
		return list;
	}
	
	public int insertChargeList(EggPayMent ep) {
		Connection conn = getConnection();
		int result = new ShopDao().insertChargeList(conn, ep);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

}
