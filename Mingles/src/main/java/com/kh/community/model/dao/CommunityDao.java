package com.kh.community.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class CommunityDao {
	
	private Properties prop = new Properties();
	
	public CommunityDao() {
		try {
			prop.loadFromXML(new FileInputStream(CommunityDao.class.getResource("/db/sql/community-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

}
