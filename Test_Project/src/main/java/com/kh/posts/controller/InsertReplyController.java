package com.kh.posts.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.posts.model.service.PostsService;
import com.kh.posts.model.vo.Reply;

/**
 * Servlet implementation class InsertReplyController
 */
@WebServlet("/insertReply.mi")
public class InsertReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		int writer = Integer.parseInt(request.getParameter("writer"));
		String content = request.getParameter("content");
		String scope = request.getParameter("scope");
		
		Reply r = new Reply(pNum, writer, content, scope);
		
		int result = new PostsService().insertReply(r);
		
		response.setContentType("json/application; charset=utf-8;");
		
		new Gson().toJson(result, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
