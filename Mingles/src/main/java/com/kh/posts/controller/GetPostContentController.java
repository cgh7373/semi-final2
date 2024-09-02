package com.kh.posts.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.posts.model.dao.PostsDao;
import com.kh.posts.model.service.PostsService;
import com.kh.posts.model.vo.Post;

/**
 * Servlet implementation class GetPostContent
 */
@WebServlet("/getPostContent.mi")
public class GetPostContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPostContentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		
		Post p = new PostsService().getPostContent(pNum);
		
		response.setContentType("json/application; charset=utf-8;");
		
		new Gson().toJson(p, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
