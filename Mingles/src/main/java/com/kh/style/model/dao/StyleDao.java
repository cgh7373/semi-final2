package com.kh.style.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;

import com.kh.style.model.vo.PurItem;
import com.kh.style.model.vo.Style;

public class StyleDao {
	
	private Properties prop = new Properties();
	public StyleDao() {
		
		String filePath = StyleDao.class.getResource("/db/sql/style-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 아바타 유무 여부 판별 - hasStyle
	public static boolean hasStyle(Connection conn, int memNo) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT COUNT(*) FROM STYLE WHERE MEM_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				flag = rset.getInt(1)>0; // true일 경우
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return flag; // false일 경우
		
	}// hasStyle
	

	public int updateStyle(Connection conn, Style st) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateStyle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, st.getHair());
			pstmt.setString(2, st.getFace());
			pstmt.setString(3, st.getTop());
			pstmt.setString(4, st.getBottom());
			pstmt.setString(5, st.getShoes());
			pstmt.setString(6, st.getWall());
			pstmt.setString(7, st.getFloor());
			pstmt.setString(8, st.getTheme());
			pstmt.setInt(9, st.getMemNo());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}// updateStyle
	
	public int insertStyle(Connection conn, Style st) {
	
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertStyle");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, st.getMemNo());
			pstmt.setString(2, st.getHair());
			pstmt.setString(3, st.getFace());
			pstmt.setString(4, st.getTop());
			pstmt.setString(5, st.getBottom());
			pstmt.setString(6, st.getShoes());
			pstmt.setString(7, st.getWall());
			pstmt.setString(8, st.getFloor());
			pstmt.setString(9, st.getTheme());

			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}// insertStyle

	public Style selectStyle(Connection conn, int userNo) {
		Style st = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectStyle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				st = new Style(
						rset.getInt("mem_no"),
						rset.getString("avatar_hair"),
						rset.getString("avatar_face"),
						rset.getString("avatar_top"),
						rset.getString("avatar_bottom"),
						rset.getString("avatar_shoes"),
						rset.getString("avatar_wall"),
						rset.getString("avatar_floor"),
						rset.getString("avatar_theme")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return st;
	}// selectStyle
	
	public int insertItem(Connection conn, PurItem pitem) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertItem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pitem.getItemNo());
			pstmt.setString(2, pitem.getItemCategory());
			pstmt.setString(3, pitem.getItemName());
			pstmt.setString(4, pitem.getFileName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}// insertItem

}
