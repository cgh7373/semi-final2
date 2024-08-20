package com.kh.posts.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.common.JDBCTemplate.*;

import com.kh.posts.model.dao.PostDao;
import com.kh.posts.model.vo.Post;

public class PostService 
{

	public ArrayList<Post> postListSelect()
	{
		Connection conn = getConnection();
		
		ArrayList<Post> list = new PostDao().postListSelect(conn);
		
		close(conn);

		return list;
	}
}
