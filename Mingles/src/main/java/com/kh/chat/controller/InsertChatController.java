package com.kh.chat.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.Chat;

/**
 * Servlet implementation class InsertChatController
 */
@WebServlet("/insert.ch")
public class InsertChatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertChatController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content = request.getParameter("content");
		int toNo = Integer.parseInt(request.getParameter("toNo"));
		int fromNo = Integer.parseInt(request.getParameter("fromNo"));
		
		Chat c = new Chat();
		c.setChatContent(content);
		c.setToNo(toNo);
		c.setFromNo(fromNo);
		
		int inChat = new ChatService().insertChat(c);
		System.out.println("controller : " + inChat);
		
		response.getWriter().print(inChat);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
