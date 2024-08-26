package com.kh.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.Friend;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FriendListController
 */
@WebServlet("/friend.ch")
public class FriendListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FriendListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		int memNo = m.getMemNo();
		ArrayList<Friend> friend = new ChatService().friendList(memNo);
		
		request.setAttribute("friend", friend); 
		request.getRequestDispatcher("views/chat/minglesChats.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
