package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Memo;
import com.kh.board.model.vo.MemoReadStatus;

import static com.kh.common.JDBCTemplate.*;

public class BoardService {

	public ArrayList<Memo> selectMemoList(int memNo, String date) {
		
		Connection conn = getConnection();
		
		ArrayList<Memo> list = new BoardDao().selectMemoList(conn, memNo, date);
		
		close(conn);
		
		return list;
	}

	public int insertMemo(Memo m) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertMemo(conn, m);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Memo> selectVisMemoList(int memNo, int visNo, String date) {
		
		Connection conn = getConnection();
		
		ArrayList<Memo> list = new BoardDao().selectVisMemoList(conn, memNo, visNo, date);
		
		close(conn);
		
		return list;
	}

	public int countMemo(int owner, String date) {
		
		Connection conn = getConnection();
		
		int count = new BoardDao().countMemo(conn, owner, date);
		
		close(conn);
		
		return count;
	}

	public ArrayList<MemoReadStatus> selectReadStatuses(MemoReadStatus rs) {
		
		Connection conn = getConnection();
		
		ArrayList<MemoReadStatus> list = new BoardDao().selectReadStatuses(conn, rs);
		
		close(conn);
		
		return list;
	}

	public void updateReadStatus(int owner, String date) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().updateReadStatus(conn, owner, date);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
				
	}

	public void insertReadStatus(MemoReadStatus rs) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertReadStatus(conn, rs);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
	}

	
	
}
