package com.kh.posts.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.vo.Member;
import com.kh.posts.model.dao.PostsDao;
import com.kh.posts.model.vo.Post;
import com.kh.posts.model.vo.Reply;

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

	public void updatePostCount(int postNum) {
		
		Connection conn = getConnection();
		
		int result = new PostsDao().updatePostCount(conn, postNum);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
	}

	public Member selectMemberFromPostNum(int postNum) {
		
		Connection conn = getConnection();
		
		Member m = new PostsDao().selectMemberFromPostNum(conn, postNum);
		
		close(conn);
				
		return m;
	}

	public Post getPostContent(int pNum) {
		
		Connection conn = getConnection();
		
		Post p = new PostsDao().getPostContent(conn, pNum);
		
		close(conn);
		
		return p;
	}

	public ArrayList<Reply> selectReplyList(int pNum) {
		
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new PostsDao().selectReplyList(conn, pNum);
		
		close(conn);
		
		return list;
	}

	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		
		int result = new PostsDao().insertReply(conn, r);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Post> selectFavoritePosts(int owner) {
		
		Connection conn = getConnection();
		
		ArrayList<Post> list = new PostsDao().selectFavoritePosts(conn, owner);
		
		close(conn);
		
		return list;
	}

}
