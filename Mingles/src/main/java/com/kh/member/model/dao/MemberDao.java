package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				m = new Member(
								  rset.getInt(1)
								, rset.getString(2)
								, rset.getString(3)
								, rset.getString(4)
								, rset.getString(5)
								, rset.getString(6)
								, rset.getString(7)
								, rset.getString(8)
								, rset.getString(9)
								, rset.getString(10)
								, rset.getString(11)
								, rset.getInt(12)
								, rset.getString(13)
								, rset.getString(14)
								, rset.getString(15)
								, rset.getString(16)
								, rset.getString(17)
								, rset.getString(18)
								, rset.getString(19)
							  );
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public Member selectNoMember(Connection conn, int userNo) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				m = new Member(
								  rset.getInt(1)
								, rset.getString(2)
								, rset.getString(3)
								, rset.getString(4)
								, rset.getString(5)
								, rset.getString(6)
								, rset.getString(7)
								, rset.getString(8)
								, rset.getString(9)
								, rset.getString(10)
								, rset.getString(11)
								, rset.getInt(12)
								, rset.getString(13)
								, rset.getString(14)
								, rset.getString(15)
								, rset.getString(16)
								, rset.getString(17)
							  );
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	public Member selectIdMember(Connection conn, String userId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectIdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				m = new Member(
								  rset.getInt(1)
								, rset.getString(2)
								, rset.getString(3)
								, rset.getString(4)
								, rset.getString(5)
								, rset.getString(6)
								, rset.getString(7)
								, rset.getString(8)
								, rset.getString(9)
								, rset.getString(10)
								, rset.getString(11)
								, rset.getInt(12)
								, rset.getString(13)
								, rset.getString(14)
								, rset.getString(15)
								, rset.getString(16)
								, rset.getString(17)
							  );
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public int insertMember(Connection conn, Member m, String zodiacSign) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPwd());
			pstmt.setString(3, m.getNickname());
			pstmt.setString(4, m.getBirthdate());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getGender());
			pstmt.setString(8, zodiacSign);
			pstmt.setString(9, m.getABO());
			pstmt.setString(10, m.getMBTI());
			pstmt.setString(11, m.getKakaoNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePwd(Connection conn, String memId, String memPwd, String updatePwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, memId);
			pstmt.setString(3, memPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateNick(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNick");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getNickname());
			pstmt.setString(2, m.getMemId());
			pstmt.setString(3, m.getMemPwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member selectMember(Connection conn, String memId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				m = new Member(
								  rset.getInt(1)
								, rset.getString(2)
								, rset.getString(3)
								, rset.getString(4)
								, rset.getString(5)
								, rset.getString(6)
								, rset.getString(7)
								, rset.getString(8)
								, rset.getString(9)
								, rset.getString(10)
								, rset.getString(11)
								, rset.getString(12)
								, rset.getString(13)
								, rset.getString(14)
								, rset.getString(15)
								, rset.getString(16)
							  );
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public int updateEmail(Connection conn, Member m) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getNickname());
			pstmt.setString(2, m.getMemId());
			pstmt.setString(3, m.getMemPwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int quitMember(Connection conn, String memId, String memPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("quitMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMBTI(Connection conn, String userId, String mbti) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMBTI");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mbti);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMsg(Connection conn, String memId, String msg) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMsg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, msg);
			pstmt.setString(2, memId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePic(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePic");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getProfilePic());
			pstmt.setString(2, m.getMemId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int chargeEgg(Connection conn, int userNo, int sum) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("chargeEgg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sum);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int idCheck(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Member> findMember(Connection conn, String findMem, String memNo) {
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Member> list = new ArrayList<Member>();
		String sql = prop.getProperty("findMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + findMem + "%");
			pstmt.setString(2, memNo);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				list.add(new Member(
										rset.getInt("MEM_NO")
									  , rset.getString("NICKNAME")
									  , rset.getString("PROFILE_PIC")
									  , rset.getString("STATUS_MSG")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Member> selectMemberByMBTI(Connection conn, String mbti, String memNo) {
		
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMemberByMBTI");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mbti);
			pstmt.setString(2, memNo);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				list.add(new Member(
										rset.getInt("MEM_NO")
									  , rset.getString("NICKNAME")
									  , rset.getString("PROFILE_PIC")
									  , rset.getString("STATUS_MSG")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int requestFriend(Connection conn, int sender, int receiver) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("requestFriend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, sender);
			pstmt.setInt(2, receiver);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Member> selectRequests(Connection conn, int memNo) {
		
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectRequests");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
					
			while (rset.next()) {
				
				list.add(new Member(
										rset.getInt("MEM_NO")
									  , rset.getString("NICKNAME")
									  , rset.getString("PROFILE_PIC")
									  , rset.getString("STATUS_MSG")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int handleRequest(Connection conn, int myMemNo, int frMemNo, String action) {
		
		PreparedStatement pstmt = null;
		boolean success = true;
		
		// 거절하는 경우
		if (action.equals("decline")) {
			
			String sql1 = prop.getProperty("declineRequest");
			
			try {
				pstmt = conn.prepareStatement(sql1);
				
				pstmt.setInt(1, frMemNo);
				pstmt.setInt(2, myMemNo);
				
				int result1 = pstmt.executeUpdate();
				success = success && (result1 > 0);
				
			} catch (SQLException e) {
				e.printStackTrace();
				success = false;
			} finally {
				close(pstmt);
			}
			
		} else if (action.equals("accept")) {
		// 수락하는 경우	
			
			String sql2 = prop.getProperty("acceptRequest");
			
			try {
				pstmt = conn.prepareStatement(sql2);
				
				pstmt.setInt(1, frMemNo);
				pstmt.setInt(2, myMemNo);
				
				int result2 = pstmt.executeUpdate();
				success = success && (result2 > 0);
				
			} catch (SQLException e) {
				e.printStackTrace();
				success = false;
			} finally {
				close(pstmt);
			}
			
			String sql3 = prop.getProperty("enrollFriend");
			
			try {
				pstmt = conn.prepareStatement(sql3);
				
				pstmt.setInt(1, myMemNo);
				pstmt.setInt(2, frMemNo);
				
				int result3 = pstmt.executeUpdate();
				success = success && (result3 > 0);
				
			} catch (SQLException e) {
				e.printStackTrace();
				success = false;
			} finally {
				close(pstmt);
			}
			
		}
		
		return success ? 1 : 0;
	}

	public ArrayList<Member> selectFriendList(Connection conn, int memNo) {
		
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFriendList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, memNo);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
						list.add(new Member(
											rset.getInt("MEM_NO")
										  , rset.getString("NICKNAME")
										  , rset.getString("PROFILE_PIC")
										  , rset.getString("STATUS_MSG")
						));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int updateFriendLevel(Connection conn, int memNo, int frNo, String setLv) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateFriendLevel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, setLv);
			pstmt.setInt(2, memNo);
			pstmt.setInt(3, frNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Member selectKakaoNo(Connection conn, String kakaoNo) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectKakaoNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, kakaoNo);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				m = new Member(
								  rset.getInt(1)
								, rset.getString(2)
								, rset.getString(3)
								, rset.getString(4)
								, rset.getString(5)
								, rset.getString(6)
								, rset.getString(7)
								, rset.getString(8)
								, rset.getString(9)
								, rset.getString(10)
								, rset.getString(11)
								, rset.getInt(12)
								, rset.getString(13)
								, rset.getString(14)
								, rset.getString(15)
								, rset.getString(16)
								, rset.getString(17)
								, rset.getString(18)
							  );
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public int UpdateKakaoNo(Connection conn, int userNo, String kakaoNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("UpdateKakaoNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kakaoNo);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int UpdateBgi(Connection conn, int memNo, String bgi) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("UpdateBgi");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bgi);
			pstmt.setInt(2, memNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
