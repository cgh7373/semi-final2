package com.kh.shop.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.dao.MemberDao;
import com.kh.shop.model.vo.EggPayMent;

public class ShopDao {
	
private Properties prop = new Properties();
	
	public ShopDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/shop-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int selectListCount(Connection conn, int userNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<EggPayMent> selectList(Connection conn, PageInfo pi, int userNo) {
		
		ArrayList<EggPayMent> list = new ArrayList<EggPayMent>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
            pstmt = conn.prepareStatement(sql);
            
            int startRow = (pi.getCurrentPage() - 1)*pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;
            
            pstmt.setInt(1, userNo);
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
              list.add(new EggPayMent(rset.getInt("pay_no"),
            		  				  rset.getInt("mem_no"),
            		  				  rset.getInt("price"),
            		  				  rset.getInt("point"),
            		  				  rset.getString("payoption"),
            		  				  rset.getString("paydate"),
            		  				  rset.getString("category")));
            }
            
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            close(rset);
            close(pstmt);
         }
         return list;
	}

}



















