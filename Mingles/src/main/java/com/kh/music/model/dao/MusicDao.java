package com.kh.music.model.dao;
import static com.kh.common.JDBCTemplate.*;


import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.music.model.vo.Music;

public class MusicDao {

	private Properties prop = new Properties();
	public MusicDao() {
		String filePath = MusicDao.class.getResource("/db/sql/music-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}// musicDao()
	public int insertMusic(Connection conn, Music ms) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMusic");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ms.getMemNo());
			pstmt.setString(2, ms.getMusicTitle());
			pstmt.setString(3, ms.getMusicSinger());
			pstmt.setString(4, ms.getMusicThumbnail());
			pstmt.setString(5, ms.getMusicFilepath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}// insertMusic
	public ArrayList<Music> selectAllMusic(Connection conn, int userNo) {
		ArrayList<Music> list = new ArrayList<Music>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllMusic");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Music(
						 rset.getInt("mem_no"),
						 rset.getInt("music_no"),
						 rset.getString("music_title"),
						 rset.getString("music_singer"),
						 rset.getString("music_thumbnail"),
						 rset.getString("music_filepath"))
						);
			};
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}// selectAllMusic
	
	
	
}
