package com.kh.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.model.vo.Attachment;
import com.kh.admin.model.vo.Blacklist;
import com.kh.admin.model.vo.Item;
import com.kh.admin.model.vo.ItemCategory;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		
		String filePath = AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath();
		filePath = URLDecoder.decode(filePath, StandardCharsets.UTF_8);
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Blacklist> selectBlacklist(Connection conn) {
		ArrayList<Blacklist> list = new ArrayList<Blacklist>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBlacklist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Blacklist(rset.getString("mem_id"),
									   rset.getString("nickname"),
									   rset.getString("block_type"),
									   rset.getInt("block_count"),
									   rset.getString("report_id"),
									   rset.getDate("block_date")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Integer> selectMemberCount(Connection conn) {
		ArrayList<Integer> count = new ArrayList<Integer>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=1; i<13; i++) {
				pstmt.setInt(1, i);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					count.add((rset.getInt("count")));
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
		
	}

	public ArrayList<Item> selecItem(Connection conn) {
		ArrayList<Item> list = new ArrayList<Item>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectItem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Item(rset.getInt("item_num")
								, rset.getString("categoryname")
								, rset.getString("item_name")
								, rset.getInt("price")
								, rset.getString("item_intro")
								, rset.getDate("item_date")
								, rset.getString("item_status")
								, rset.getString("save_file")
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

	public ArrayList<ItemCategory> selectItemCategory(Connection conn) {
		ArrayList<ItemCategory> itemCategory = new ArrayList<ItemCategory>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectItemCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				itemCategory.add(new ItemCategory(rset.getString("item_category")
												, rset.getString("categoryname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return itemCategory;
	}

	public ArrayList<Item> choiceCategory(Connection conn, String ic) {
		ArrayList<Item> itemList = new ArrayList<Item>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("choiceCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ic);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				itemList.add(new Item(rset.getInt("item_num")
									, rset.getString("categoryname")
									, rset.getString("item_name")
									, rset.getInt("price")
									, rset.getString("item_intro")
									, rset.getDate("item_date")
									, rset.getString("item_status")
									, rset.getString("SAVE_FILE")
									));
						}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return itemList;
	}

	public int insertItemImg(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertItemImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertItem(Connection conn, Item i) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertItem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i.getItemCategory());
			pstmt.setString(2, i.getItemName());
			pstmt.setInt(3, i.getPrice());
			pstmt.setString(4, i.getItemExplan());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Member> selectMemberList(Connection conn, PageInfo pi) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
		
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("mem_no")
						, rset.getString("mem_id")
						, rset.getString("nickname")
						, rset.getString("birthday")
						, rset.getString("email")
						, rset.getString("gender")
						, rset.getString("enroll_date")
						, rset.getInt("egg")
						, rset.getString("status")));				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int memberCount(Connection conn) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("memberCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
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

	public int insertBlackList(Connection conn, int memNo) {
		int result1 = 0;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset = null;
		String sql = prop.getProperty("insertBlackList");
		String sql2 = prop.getProperty("updateBlcokCount");
		try {
			// insert
			pstmt1 = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt1.setInt(1, memNo);
			
			result1 = pstmt1.executeUpdate();
			
			rset = pstmt1.getGeneratedKeys();
			if(rset.next()) {
				int blackNo = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt1);
		}
		
		
		
		return result1;
	}

	public int updateBlockCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBlockCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
