package com.kh.common.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;

public class CommonDao {

	private Properties prop = new Properties();
	
	public CommonDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/common-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}


	
}
