package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

}
