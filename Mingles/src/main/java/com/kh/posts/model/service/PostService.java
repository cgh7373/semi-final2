package com.kh.posts.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.PageInfo;
import com.kh.posts.model.dao.PostDao;
import com.kh.posts.model.vo.Attachment;
import com.kh.posts.model.vo.Post;

public class PostService 
{
	public int selectListCount()
	{
		Connection conn = getConnection();
		int listCount = new PostDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}
	public ArrayList<Post> postListSelect(PageInfo pi)
	{
		Connection conn = getConnection();
		ArrayList<Post> list = new PostDao().postListSelect(conn,pi);
		close(conn);
		return list;
	}
	public int postInsert(Post p, Attachment at)
	{
		
		 Connection conn = getConnection();
		int result1 = new PostDao().postInsert(conn, p);
		int result2 = 1;
		if(at != null)
		{
			result2 = new PostDao().postInsertAttachment(conn, at);
		}
		if(result1 > 0 && result2 > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	}
}
