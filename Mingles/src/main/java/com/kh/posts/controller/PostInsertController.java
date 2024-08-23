package com.kh.posts.controller;

import java.io.File;
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
import com.kh.common.model.vo.PageInfo;
import com.kh.posts.model.service.PostService;
import com.kh.posts.model.vo.Attachment;
import com.kh.posts.model.vo.Post;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class PostInsertController
 */
@WebServlet("/insert.po")
public class PostInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		if(ServletFileUpload.isMultipartContent(request))
		{
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/post_upFiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			String postTitle =  multiRequest.getParameter("title");
			String postTag = multiRequest.getParameter("tag");
			String postScop = multiRequest.getParameter("scop");
			String postContent =  multiRequest.getParameter("content");
			String postWriter = multiRequest.getParameter("userNo");
			Post p = new Post();
			p.setPostTitle(postTitle);
			p.setPostTag(postTag);
			p.setPostScope(postScop);
			p.setPostContent(postContent);
			p.setPostWriter(postWriter);
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null)
			{
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/board_upfiles/");
			}
			int result = new PostService().postInsert(p,at);
			if(result > 0)
			{
				response.setContentType("application/json; charset=utf-8"); 
				response.getWriter().print(result);
				//request.getRequestDispatcher("views/posts/minglesPosts.jsp").forward(request, response);
			}
			else
			{
				if(at != null)
				{
					new File(savePath + at.getChangeName()).delete();
				}
			}
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
