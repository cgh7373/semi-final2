package com.kh.music.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.music.model.dao.MusicDao;
import com.kh.music.model.vo.Music;

public class MusicService {

	public int insertMusic(Music ms) {
		Connection conn = getConnection();
		
		int result = new MusicDao().insertMusic(conn, ms);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}// insertMusic

	public ArrayList<Music> selectAllMusic(int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Music> list = new MusicDao().selectAllMusic(conn, userNo);

		close(conn);
		return list;
	}// selectAllMusic

	public int deleteMusic(int memNo, int musicNo) {
		Connection conn = getConnection();
		
		int result = new MusicDao().deleteMusic(conn, memNo, musicNo);

		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}// deleteMusic

}
