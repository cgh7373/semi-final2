package com.kh.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.Chat;
import com.kh.chat.model.vo.Chatting;
import com.kh.chat.model.vo.Friend;
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
		int toNo = Integer.parseInt(request.getParameter("toNo"));
		int fromNo = Integer.parseInt(request.getParameter("fromNo"));
		
		ArrayList<Chat> chatList = new ChatService().chatList(toNo, fromNo);
		System.out.println(chatList);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(chatList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
