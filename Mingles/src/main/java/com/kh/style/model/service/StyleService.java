package com.kh.style.model.service;
import static com.kh.common.JDBCTemplate.*;
import java.sql.Connection;
import static com.kh.common.JDBCTemplate.*;
import com.kh.style.model.dao.StyleDao;
import com.kh.style.model.vo.PurItem;
import com.kh.style.model.vo.Style;

public class StyleService {
	
	public boolean hasStyle(int memNo) {
		Connection conn = getConnection();
		boolean flag = StyleDao.hasStyle(conn, memNo);
		close(conn);
		return flag;
	}// hasStyle
	

	public int updateStyle(Style st) {
		Connection conn = getConnection();
		
		int result = new StyleDao().updateStyle(conn, st);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}// updateStyle
	
	
	public int insertStyle(Style st) {
		Connection conn = getConnection();

		int result = new StyleDao().insertStyle(conn, st);

		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}// insertStyle


	public Style selectStyle(int userNo) {

		Connection conn = getConnection();
		
		Style st = new StyleDao().selectStyle(conn, userNo);
		
		close(conn);
		return st;
	}// selectStyle
	
	public int insertItem(PurItem pitem) {
		Connection conn = getConnection();
		
		int result = new StyleDao().insertItem(conn, pitem);
		
		close(conn);
		return result;
		
	}// insertItem
	
	
}
