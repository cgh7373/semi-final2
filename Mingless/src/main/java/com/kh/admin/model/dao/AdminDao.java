package com.kh.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.model.vo.Attachment;
import com.kh.admin.model.vo.Blacklist;
import com.kh.admin.model.vo.Item;
import com.kh.admin.model.vo.ItemCategory;
import com.kh.admin.model.vo.Notice;
import com.kh.admin.model.vo.Post;
import com.kh.admin.model.vo.PostType;
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
	
	public ArrayList<Integer> selectPostCount(Connection conn) {
		ArrayList<Integer> count = new ArrayList<Integer>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPostCount");
		
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
								, rset.getString("change_name")
								, rset.getString("item_tag")
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
									, rset.getString("item_tag")
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
			pstmt.setString(5,i.getItemTag());
			
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
		int result2 = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("insertBlackList");
		String sql2 = prop.getProperty("updateBlockCount");
		String getSeqSql = "SELECT SEQ_BLACKLIST.CURRVAL AS BLACKLIST_NO FROM DUAL";
		try {
			// insert
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			result1 = pstmt.executeUpdate();
			
			// 시퀀스 가져오기
			pstmt = conn.prepareStatement(getSeqSql);
			int blackListNo = 0;
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				blackListNo = rset.getInt("BLACKLIST_NO");
			}
			
			// count update
			if(blackListNo > 0) {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, blackListNo);
				
				result2 = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return result1 * result2;
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
	
	public int updateBkStatus(Connection conn, int memNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBkStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	public int deleteItem(Connection conn, int itemNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteItem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePrice(Connection conn, int itemNo, int price) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePrice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, price);
			pstmt.setInt(2, itemNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateItemImg(Connection conn, Attachment at, int itemNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateItemImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setInt(3, itemNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int deleteImg(Connection conn, String originFileName) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, originFileName);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Member> searchMember(Connection conn, String keyWord) {
		ArrayList<Member> scMember = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyWord +"%");
			pstmt.setString(2, "%" + keyWord +"%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				scMember.add(new Member(rset.getInt("mem_no")
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
		
		return scMember;
	}

	public int deleteBlack(Connection conn, int memNo) {
		int result1 = 0;
		int result2 = 0;
		PreparedStatement pstmt = null;
		String sql1 = prop.getProperty("deleteBlack");
		String sql2 = prop.getProperty("updateBkStatusY");
		
		try {
			// 블랙리스트 테이블에서 삭제
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, memNo);
			
			result1 = pstmt.executeUpdate();
			
			// MEMBER STATUS B => Y
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, memNo);
			
			result2 = pstmt.executeUpdate();
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result1 * result2;
	}

	public ArrayList<Post> selectPostList(Connection conn) {
		ArrayList<Post> postArr = new ArrayList<Post>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPostList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				postArr.add(new Post(rset.getInt("post_num")
						   		   , rset.getInt("post_type")
						   		   , rset.getString("post_title")
						   		   , rset.getString("post_content")
						   		   , rset.getString("post_tag")
						   		   , rset.getString("post_scope")
						   		   , rset.getString("nickname")
						   		   , rset.getInt("post_count")
						   		   , rset.getString("post_regdate")
						   		   , rset.getString("post_attachment")
						   		   , rset.getString("post_block")));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return postArr;
	}

	public int insertNoticeImg(Connection conn, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("insertNoticeImg");
		String sqlCurrVal = "SELECT SEQ_ATT.CURRVAL FROM dual";
		
		String savePath = notice.getSavePath();
		String fileName = savePath.substring(savePath.lastIndexOf("/") + 1);
		String filePath = "/resources/post_upfiles/";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileName);
			pstmt.setString(3, filePath);
			
			result = pstmt.executeUpdate();
			
			if (result > 0) {
				pstmt = conn.prepareStatement(sqlCurrVal);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					result = rset.getInt(1);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int insertNotice(Connection conn, Notice notice, int fileNo) {
		int postNo = 0;
		PreparedStatement pstmt = null;			
		ResultSet rset = null;
		String sql = prop.getProperty("insertNotice");
		String sqlCurrVal = "SELECT SEQ_POST.CURRVAL FROM dual";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			if (fileNo > 0 ) {
				pstmt.setInt(3, fileNo);
			}else {
				pstmt.setInt(3, 28);
			}
			postNo = pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sqlCurrVal);
			rset = pstmt.executeQuery();
			
			if(postNo > 0) {
				if(rset.next()) {
					postNo = rset.getInt(1);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return postNo;
	}
	
	public int insertNoticeHTML(Connection conn, String html, int postNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNoticeHTML");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, html);
			pstmt.setInt(2, postNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String selectNoticeHTML(Connection conn, int postNum) {
		String html = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeHTML");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				html = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);	
		}
		
		return html;
	}

	public int deleteNotice(Connection conn, int postNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePostBlock(Connection conn, int postNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePostBlock");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<PostType> selectPostType(Connection conn) {
		ArrayList<PostType> pt = new ArrayList<PostType>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPostType");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pt.add(new PostType(rset.getInt(1)
								  , rset.getString(2)));
				
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pt;
	}

	public ArrayList<Post> choicePostType(Connection conn, String postTN) {
		ArrayList<Post> postArr = new ArrayList<Post>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("choicePostType");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, postTN);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				postArr.add(new Post(rset.getInt("post_num")
						   		   , rset.getInt("post_type")
						   		   , rset.getString("post_title")
						   		   , rset.getString("post_content")
						   		   , rset.getString("post_tag")
						   		   , rset.getString("post_scope")
						   		   , rset.getString("nickname")
						   		   , rset.getInt("post_count")
						   		   , rset.getString("post_regdate")
						   		   , rset.getString("post_attachment")
						   		   , rset.getString("post_block")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return postArr;
	}

	public Post selectPost(Connection conn, int postNo) {
		Post p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p = new Post(rset.getInt("post_num")
				   		   , rset.getInt("post_type")
				   		   , rset.getString("post_title")
				   		   , rset.getString("post_content")
				   		   , rset.getString("post_tag")
				   		   , rset.getString("post_scope")
				   		   , rset.getString("nickname")
				   		   , rset.getInt("post_count")
				   		   , rset.getString("post_regdate")
				   		   , rset.getString("post_status")
				   		   , rset.getString("post_block")
				   		   , rset.getString("savepath"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}


	
}
