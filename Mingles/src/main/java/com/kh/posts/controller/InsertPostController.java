package com.kh.posts.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.kh.common.MyFileRenamePolicy;
import com.kh.posts.model.service.PostsService;
import com.kh.posts.model.vo.Post;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertPostController
 */
@WebServlet("/insertPost.mi")
public class InsertPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		if (ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());

			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String tags = multiRequest.getParameter("tags");
			String scope = multiRequest.getParameter("scope");
			int memNo = Integer.parseInt(multiRequest.getParameter("memNo")); 
			String color = multiRequest.getParameter("color");
			int size = Integer.parseInt(multiRequest.getParameter("size"));
			String changeName = multiRequest.getFilesystemName("image");
			
			String filePath = "../../resources/images/";
			
			if (changeName == null) {
				changeName = "2024090609460747614.jpg";
			}
			
			String image = filePath + changeName;
			
			Post p = new Post();
			p.setPostTitle(title);
			p.setPostContent(content);
			p.setPostTag(tags);
			p.setPostScope(scope);
			p.setPostWriter(memNo);
			p.setPostTitleColor(color);
			p.setPostTitleSize(size);
			p.setPostThumbnail(image);
			
			int result = new PostsService().insertPosts(p);
			
			response.setContentType("json/application; charset=utf-8;");
			
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
