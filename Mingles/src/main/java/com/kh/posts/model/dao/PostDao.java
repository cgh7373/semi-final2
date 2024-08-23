package com.kh.posts.model.dao;

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
import com.kh.posts.model.vo.Attachment;
import com.kh.posts.model.vo.Post;

public class PostDao 
{
	private Properties prop = new Properties();
	public PostDao()
	{
		try 
		{
			prop.loadFromXML(new FileInputStream(PostDao.class.getResource("/db/sql/post-mapper.xml").getPath()));
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
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
	public ArrayList<Post> postListSelect(Connection conn,PageInfo pi)
	{
		ArrayList<Post> list = new ArrayList<Post>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("postListSelect");
		
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
								  rset.getString("post_title"),
								  rset.getString("post_tag"),
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
	public int postInsert(Connection conn, Post p)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("postInsert");
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getPostTitle());
			pstmt.setString(2, p.getPostTag());
			pstmt.setString(3, p.getPostScope());
			pstmt.setString(4, p.getPostContent());
			pstmt.setInt(5, Integer.parseInt(p.getPostWriter()));
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
	public int postInsertAttachment(Connection conn, Attachment at)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("postInsertAttachment");
		System.out.println(at);
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
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
	
	
	
}
