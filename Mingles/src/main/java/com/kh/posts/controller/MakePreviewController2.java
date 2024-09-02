package com.kh.posts.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.posts.model.vo.Post;

/**
 * Servlet implementation class MakePreviewController2
 */
@WebServlet("/makePreview2.mi")
public class MakePreviewController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakePreviewController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title"); 
        String color = request.getParameter("color");
        String tag = request.getParameter("tag");
        int size = Integer.parseInt(request.getParameter("size"));
        
        ArrayList<Post> list = new ArrayList<Post>();
        
        Post p = new Post();
        
        p.setPostTitle(title);
        p.setPostTitleColor(color);
        p.setPostTag(tag);
        p.setPostCount(size);
        
        list.add(p);
        
        response.setContentType("json/application; charset=utf-8;");
        
        new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
