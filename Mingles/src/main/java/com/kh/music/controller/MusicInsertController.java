package com.kh.music.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.music.model.service.MusicService;
import com.kh.music.model.vo.Music;
import com.oreilly.servlet.multipart.Part;

/**
 * Servlet implementation class MusicInsertController
 */
@WebServlet("/insertMusic.msc")
@MultipartConfig
public class MusicInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String saveDir = "/resources/music_upfiles";
       
    private String replaceTitle(String fileName) {
        if (fileName == null) {
            return null;
        }
        return fileName.replace(" ", "_");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String title = request.getParameter("title");
		String singer = request.getParameter("singer");
		
		javax.servlet.http.Part musicFile = request.getPart("musicFile");
		javax.servlet.http.Part musicThumbnail = request.getPart("musicThumbnail");
		
		if(musicFile != null && musicThumbnail != null) {
			
			String musicFileName = replaceTitle(musicFile.getSubmittedFileName());
			String musicThumbnailName = replaceTitle(musicThumbnail.getSubmittedFileName());
			
			String uploadPath = getServletContext().getRealPath("")+File.separator + saveDir;
			File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); 
            }
            
			String musicFilePath = uploadPath + File.separator + musicFileName;
			String musicThumbnailPath = uploadPath + File.separator + musicThumbnailName;
			
	        musicFile.write(musicFilePath);
            musicThumbnail.write(musicThumbnailPath);
			
			Music ms = new Music();
			ms.setMemNo(memNo);
			ms.setMusicTitle(title);
			ms.setMusicSinger(singer);
			ms.setMusicFilepath(saveDir + "/" + musicFileName);
			ms.setMusicThumbnail(saveDir + "/" + musicThumbnailName);
			
			int result = new MusicService().insertMusic(ms);
			
			response.setContentType("application/json; charset=utf-8");			
			new Gson().toJson(result, response.getWriter());
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
