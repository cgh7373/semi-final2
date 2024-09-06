package com.kh.posts.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.posts.model.service.PostsService;
import com.kh.posts.model.vo.Reply;

/**
 * Servlet implementation class PostComentInsertController
 */
@WebServlet("/rinsert.po")
public class InsertPostComentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPostComentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replyContent = request.getParameter("content");
		int postNo = Integer.parseInt(request.getParameter("pno"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		
		Reply r = new Reply();
		r.setReplyContent(replyContent);
		r.setReplyOwnPost(postNo);
		r.setReplyWriter(userNo);
		
		int result = new PostsService().insertReply(r);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
