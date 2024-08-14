package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) {
		
		String originName = originFile.getName();
		
		// 파일 업로드시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 5자리 랜덤
		int ranNum = (int)(Math.random()*90000 + 10000);
		
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		return new File(originFile.getParent(), changeName);
	}
	
	
}
