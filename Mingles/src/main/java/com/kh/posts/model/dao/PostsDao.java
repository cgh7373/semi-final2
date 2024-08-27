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

import com.kh.member.model.dao.MemberDao;
import com.kh.posts.model.vo.Post;

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
				
				p.setPostTitle(rset.getString(1));
				p.setPostContent(rset.getString(2));
				p.setPostTag(rset.getString(3));
				p.setPostCount(rset.getInt(4));
				p.setPostRegdate(rset.getDate(5));
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
	
}
