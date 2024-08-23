package com.kh.chat.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.chat.model.service.ChatService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ChattingController
 */
@WebServlet("/chatting.ch")
public class ChattingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChattingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String chatContent = request.getParameter("Content");
		int fNo = Integer.parseInt(request.getParameter("fNo"));
//		int chatNo = Integer.parseInt(request.getParameter("chatNo"));
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int chatNo = new ChatService().chatNo(m);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
