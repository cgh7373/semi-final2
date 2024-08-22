package com.kh.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Memo;
import com.kh.member.model.dao.MemberDao;
import static com.kh.common.JDBCTemplate.*;

public class BoardDao {

private Properties prop = new Properties();
	
	public BoardDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<Memo> selectMemoList(Connection conn, int memNo, String date) {
		
		ArrayList<Memo> list = new ArrayList<Memo>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMemoList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, date);
			pstmt.setInt(2, memNo);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				list.add(new Memo(
									rset.getInt(1)
								  , rset.getInt(2)
								  , rset.getString(3)
								  , rset.getString(4)
								  , rset.getString(5)
								  , rset.getString(6)
								  , rset.getString(7)
						));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int insertMemo(Connection conn, Memo m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMemo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, m.getMemoOwner());
			pstmt.setInt(2, m.getMemoWriter());
			pstmt.setString(3, m.getMemoContent());
			pstmt.setString(4, m.getMemoDate());
			pstmt.setString(5, m.getMemoScope());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Memo> selectVisMemoList(Connection conn, int memNo, int visNo, String date) {
		
		ArrayList<Memo> list = new ArrayList<Memo>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectVisMemoList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, date);
			pstmt.setInt(2, memNo);
			pstmt.setInt(3, visNo);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
					 list.add(new Memo(
										rset.getInt(1)
									  , rset.getInt(2)
									  , rset.getString(3)
									  , rset.getString(4)
									  , rset.getString(5)
									  , rset.getString(6)
									  , rset.getString(7)
									  ));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int countMemo(Connection conn, int owner, String date) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countMemo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, owner);
			pstmt.setString(2, date);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
}
