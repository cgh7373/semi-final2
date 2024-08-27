package com.kh.posts.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.posts.model.dao.PostsDao;
import com.kh.posts.model.vo.Post;

public class PostsService {

	public int insertPosts(Post p) {
		
		Connection conn = getConnection();
		
		int result = new PostsDao().insertPosts(conn, p);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Post> selectPostsList(int writer) {
		
		Connection conn = getConnection();
		
		ArrayList<Post> list = new PostsDao().selectPostsList(conn, writer);
		
		close(conn);
		
		return list;
	}

}
