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
		
//		int toNo = Integer.parseInt(request.getParameter("toNo"));
//		int fromNo = Integer.parseInt(request.getParameter("fromNo"));
//		
//		ArrayList<Chat> chatList = new ChatService().chatList(toNo, fromNo);
//		
//		if(chatList.isEmpty()) {
//			response.setContentType("application/json; charset=utf-8");
//			new Gson().toJson(chatList, response.getWriter());
//		}else {
//			response.setContentType("application/json; charset=utf-8");
//			new Gson().toJson(chatList, response.getWriter());			
//		}
		
		String toNoString = request.getParameter("toNo");
	    String fromNoString = request.getParameter("fromNo");
	    String loginNoString = request.getParameter("loginNo");
	    
	    int toNo = 0;
	    int fromNo = 0;
	    int loginNo = 0;

	    try {
	        if (toNoString != null && !toNoString.isEmpty()) {
	            toNo = Integer.parseInt(toNoString);
	        }
	        if (fromNoString != null && !fromNoString.isEmpty()) {
	            fromNo = Integer.parseInt(fromNoString);
	        }
	        if (loginNoString != null && !loginNoString.isEmpty()) {
	            loginNo = Integer.parseInt(loginNoString);
	        }
	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	    }
	    
	    ArrayList<Chat> chatList = new ChatService().chatList(toNo, fromNo);
	    
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
