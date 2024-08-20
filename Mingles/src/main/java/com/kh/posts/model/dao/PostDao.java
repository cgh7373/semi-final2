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
	
	public ArrayList<Post> postListSelect(Connection conn)
	{
		ArrayList<Post> list = new ArrayList<Post>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("postListSelect");
		
		try 
		{
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next())
			{
				list.add(new Post(rset.getInt("post_num"),
								  rset.getString("post_title"),
								  rset.getString("post_tag"),
								  rset.getInt("post_count"),
								  rset.getString("post_regdate")));
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
	
	
}
