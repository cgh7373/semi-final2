package com.kh.posts.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.posts.model.vo.Post;
import com.kh.posts.model.vo.Reply;

public class PostsDao {

	private Properties prop = new Properties();
	
	public PostsDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/post-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public int increaseCount(Connection conn, int postNum)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePostCount");

		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			close(pstmt);
		}
		return result;
	}
	public int selectListCount(Connection conn)
	{
		//select문 =>resultset (한개) =>int
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next())
			{
				listCount = rset.getInt("count");
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	public Post selectPost(Connection conn,int pno)
	{
		Post p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPost");
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				
				p = new Post( rset.getString("post_title"),
							 rset.getString("post_content"),
							 rset.getString("post_scope"),
							 rset.getString("post_thumbnail"),
							 rset.getInt("post_num"),
							 rset.getString("post_tag"));
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally   
		{
			close(pstmt);
			close(rset);
		}
		return p;
	}
	public Post selectNotice(Connection conn,int pno)
	{
		Post p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				
				p = new Post( rset.getString("notice_html"));
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally   
		{
			close(pstmt);
			close(rset);
		}
		return p;
	}
	public ArrayList<Post> selectList(Connection conn,int writer, PageInfo pi)
	{
		ArrayList<Post> list = new ArrayList<Post>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		try 
		{
			pstmt=conn.prepareStatement(sql);
			int startRow =  (pi.getCurrentPage()-1)*pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, writer);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				list.add(new Post(rset.getInt("post_num"),
								  rset.getString("post_scope"),
								  rset.getString("post_title"),
								  rset.getInt("post_count"),
								  rset.getString("create_date")));
			}
		} 
		catch (SQLException e)
		{

			e.printStackTrace();
		}
		finally
		{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Post> selectNoticeList(Connection conn,PageInfo pi)
	{
		ArrayList<Post> list = new ArrayList<Post>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeList");
		try 
		{
			pstmt=conn.prepareStatement(sql);
			int startRow =  (pi.getCurrentPage()-1)*pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				list.add(new Post(rset.getInt("post_num"),
								  rset.getString("post_scope"),
								  rset.getString("post_title"),
								  rset.getInt("post_count"),
								  rset.getString("create_date")));
			}
		} 
		catch (SQLException e)
		{

			e.printStackTrace();
		}
		finally
		{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public int postDelete(Connection conn, int pno)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("postDelete");
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			result = pstmt.executeUpdate();
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<Post> selectPopularList(Connection conn) 
	{
		
	
		ArrayList<Post> list = new ArrayList<Post>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectPopularList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				Post p = new Post();
				
				p.setPostNum(rset.getInt(1));
				p.setPostTitle(rset.getString(2));
				p.setPostTag(rset.getString(3));
				p.setPostCount(rset.getInt(4));
				p.setPostRegdate(rset.getString(5));
				p.setPostTitleColor(rset.getString(6));
				p.setPostTitleSize(rset.getInt(7));
				p.setPostThumbnail(rset.getString(8));
				
				list.add(p);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public ArrayList<Post> selectPopularListSearch(Connection conn, String searchtag) {
		
		ArrayList<Post> list = new ArrayList<Post>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectPopularListSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchtag+"%");
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				Post p = new Post();
				
				p.setPostNum(rset.getInt(1));
				p.setPostTitle(rset.getString(2));
				p.setPostTag(rset.getString(3));
				p.setPostCount(rset.getInt(4));
				p.setPostRegdate(rset.getString(5));
				p.setPostTitleColor(rset.getString(6));
				p.setPostTitleSize(rset.getInt(7));
				p.setPostThumbnail(rset.getString(8));
				
				list.add(p);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public int updatePost(Connection conn, Post p)
	{
		int result = 0;
		PreparedStatement pstmt  = null;
		String sql = prop.getProperty("updatePost");
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getPostScope());
			pstmt.setString(2, p.getPostTitle());
			pstmt.setString(3, p.getPostTag());
			pstmt.setString(4, p.getPostContent());
			pstmt.setInt(5, p.getPostNum());
			
			result = pstmt.executeUpdate();
			
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			close(pstmt);
		}
		return result;
	}
	public int insertPosts(Connection conn, Post p) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPosts");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getPostTitle());
			pstmt.setString(2, p.getPostContent());
			pstmt.setString(3, p.getPostTag());
			pstmt.setString(4, p.getPostScope());
			pstmt.setInt(5, p.getPostWriter());
			pstmt.setString(6, p.getPostTitleColor());
			pstmt.setInt(7, p.getPostTitleSize());
			pstmt.setString(8, p.getPostThumbnail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Post> selectPostsList(Connection conn, int writer) {
		
		ArrayList<Post> list = new ArrayList<Post>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectPostsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, writer);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				Post p = new Post();
				
				p.setPostNum(rset.getInt(1));
				p.setPostTitle(rset.getString(2));
				p.setPostTag(rset.getString(3));
				p.setPostCount(rset.getInt(4));
				p.setPostRegdate(rset.getString(5));
				p.setPostTitleColor(rset.getString(6));
				p.setPostTitleSize(rset.getInt(7));
				p.setPostThumbnail(rset.getString(8));
				p.setReplyCount(rset.getInt(9));
				
				list.add(p);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int updatePostCount(Connection conn, int postNum) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePostCount");
		
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

	public Member selectMemberFromPostNum(Connection conn, int postNum) {
		
		Member m = new Member();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMemberFromPostNum");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, postNum);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				m.setNickname(rset.getString(1));
				m.setProfilePic(rset.getString(2));
				m.setStatusMsg(rset.getString(3));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public Post getPostContent(Connection conn, int pNum) {
		
		Post p = new Post();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getPostContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pNum);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				p.setPostTitle(rset.getString(1));
				p.setPostContent(rset.getString(2));
				p.setPostTag(rset.getString(3));
				p.setPostTitleColor(rset.getString(4));
				p.setPostTitleSize(rset.getInt(5));
				p.setPostThumbnail(rset.getString(6));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	public ArrayList<Reply> selectReplyList(Connection conn, int pNum) {
		
		ArrayList<Reply> list = new ArrayList<Reply>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pNum); 
			
			rset = pstmt.executeQuery();
					
			while (rset.next()) {
				
				Reply r = new Reply();
				
				r.setReplyNo(rset.getInt(1));
				r.setReplyWriter(rset.getInt(2));
				r.setReplyContent(rset.getString(3));
				r.setReplyScope(rset.getString(4));
				r.setReplyDate(rset.getString(5));
				r.setReplyStatus(rset.getString(6));
				
				list.add(r);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public int insertReply(Connection conn, Reply r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getReplyOwnPost());
			pstmt.setInt(2, r.getReplyWriter());
			pstmt.setString(3, r.getReplyContent());
			pstmt.setString(4, r.getReplyScope());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Post> selectFavoritePosts(Connection conn, int owner) {
		
		ArrayList<Post> list = new ArrayList<Post>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectFavoritePosts");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, owner);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				Post p = new Post();
				
				p.setPostNum(rset.getInt(1));
				p.setPostTitle(rset.getString(2));
				p.setPostThumbnail(rset.getString(3));
				
				list.add(p);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Post> selectRecentRepliedPosts(Connection conn, int owner) {
		
		ArrayList<Post> list = new ArrayList<Post>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectRecentRepliedPosts");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, owner);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				Post p = new Post();
				
				p.setPostNum(rset.getInt(1));
				p.setPostTitle(rset.getString(2));
				p.setPostThumbnail(rset.getString(3));
				
				list.add(p);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
}
