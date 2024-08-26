package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {

		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return m;
	}
	
	public Member selectNoMember(int userNo) {

		Connection conn = getConnection();
		
		Member m = new MemberDao().selectNoMember(conn, userNo);
		
		close(conn);
		
		return m;
	}
	
	public Member selectIdMember(String userId) {

		Connection conn = getConnection();
		
		Member m = new MemberDao().selectIdMember(conn, userId);
		
		close(conn);
		
		return m;
	}

	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		
		SimpleDateFormat std = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dts = new SimpleDateFormat("MMdd");
		
		int birthDate = 0;
		try {
			birthDate = Integer.parseInt(dts.format(std.parse(m.getBirthdate())));
		} catch (NumberFormatException | ParseException e) {
			e.printStackTrace();
		}
		
		String zodiacSign = null;
		
		if ((birthDate >= 321 && birthDate <= 419)) {
            zodiacSign = "양자리";
        } else if ((birthDate >= 420 && birthDate <= 520)) {
            zodiacSign = "황소자리";
        } else if ((birthDate >= 521 && birthDate <= 621)) {
            zodiacSign = "쌍둥이자리";
        } else if ((birthDate >= 622 && birthDate <= 722)) {
            zodiacSign = "게자리";
        } else if ((birthDate >= 723 && birthDate <= 822)) {
            zodiacSign = "사자자리";
        } else if ((birthDate >= 823 && birthDate <= 922)) {
            zodiacSign = "처녀자리";
        } else if ((birthDate >= 923 && birthDate <= 1022)) {
            zodiacSign = "천칭자리";
        } else if ((birthDate >= 1023 && birthDate <= 1122)) {
            zodiacSign = "전갈자리";
        } else if ((birthDate >= 1123 && birthDate <= 1221)) {
            zodiacSign = "사수자리";
        } else if ((birthDate >= 1222 || birthDate <= 119)) {
            zodiacSign = "염소자리";
        } else if ((birthDate >= 120 && birthDate <= 218)) {
            zodiacSign = "물병자리";
        } else if ((birthDate >= 219 && birthDate <= 320)) {
            zodiacSign = "물고기자리";
        }
		
		int result = new MemberDao().insertMember(conn, m, zodiacSign);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}

	public Member updatePwd(String memId, String memPwd, String updatePwd) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwd(conn, memId, memPwd, updatePwd);
		
		Member updateMem = null;
		if (result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, memId);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}

	public Member updateNick(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateNick(conn, m);
		
		Member updateMem = null;
		if (result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getMemId());
		} else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}

	public Member updateEmail(Member m) {

		Connection conn = getConnection();
		
		int result = new MemberDao().updateEmail(conn, m);
		
		Member updateMem = null;
		if (result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getMemId());
		} else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}

	public int quitMember(String memId, String memPwd) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().quitMember(conn, memId, memPwd);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int chargeEgg(int userNo, int sum) {
		Connection conn = getConnection();
		int result = new MemberDao().chargeEgg(conn, userNo, sum);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public int idCheck(String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().idCheck(conn, userId);
		
		close(conn);
		return result;
	}
	
	

	public Member updateMBTI(String userId, String mbti) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMBTI(conn, userId, mbti);
		
		Member updateMem = null;
		if (result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, userId);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}

	public Member updateMsg(String memId, String msg) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMsg(conn, memId, msg);
		
		Member updateMem = null;
		if (result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, memId);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}

	public Member updatePic(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePic(conn, m);
		
		Member updateMem = null;
		if (result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getMemId());
		} else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}

	public ArrayList<Member> findMember(String findMem, String memNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().findMember(conn, findMem, memNo);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Member> selectMemberByMBTI(String mbti, String memNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMemberByMBTI(conn, mbti, memNo);
		
		close(conn);
		
		return list;
	}

	public int requestFriend(int sender, int receiver) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().requestFriend(conn, sender, receiver);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Member> selectRequests(int memNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectRequests(conn, memNo);
		
		close(conn);
		
		return list;
	}

	public int handleRequest(int myMemNo, int frMemNo, String action) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().handleRequest(conn, myMemNo, frMemNo, action);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Member> selectFriendList(int memNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectFriendList(conn, memNo);
		
		close(conn);
				
		return list;
	}

	public int updateFriendLevel(int memNo, String setLv) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateFriendLevel(conn, memNo, setLv);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
				
		return result;
	}

	public Member selectKakaoNo(String kakaoNo) {
		Connection conn = getConnection();
		Member m = new MemberDao().selectKakaoNo(conn, kakaoNo);
		close(conn);
		return m;
	}
	
	public int UpdateKakaoNo(int userNo, String kakaoNo) {
		Connection conn = getConnection();
		int result = new MemberDao().UpdateKakaoNo(conn, userNo, kakaoNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


}











