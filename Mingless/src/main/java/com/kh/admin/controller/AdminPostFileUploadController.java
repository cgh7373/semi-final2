package com.kh.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



/**
 * Servlet implementation class AdminPostFileUploadController
 */
@WebServlet("/upload-image")
@MultipartConfig
public class AdminPostFileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPostFileUploadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 저장 경로 설정
		String savePath = request.getSession().getServletContext().getRealPath("/resources/post_upfiles/");
		// 파일 파트 가져오기
		Part filePart = request.getPart("file");
		String fileName = filePart.getSubmittedFileName();		
		String changeName = newFileName(fileName);
		String filePath = savePath + File.separator + changeName;
		// 파일 저장
		filePart.write(filePath);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write("{\"url\": \"./resources/post_upfiles/" + changeName + "\"}");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String newFileName(String originName) {
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        int ranNum = (int)(Math.random() * 90000 + 10000);
        String ext = originName.substring(originName.lastIndexOf("."));
        return currentTime + ranNum + ext;
    }

}
