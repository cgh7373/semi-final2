package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.admin.model.service.AdminService;
import com.kh.admin.model.vo.Chat;

/**
 * Servlet implementation class AdminChatController
 */
@WebServlet("/adminChat.am")
public class AdminChatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChatController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		int adminNo = Integer.parseInt(request.getParameter("fromNo"));
		ArrayList<Chat> chatList = new AdminService().selectChatList(memId, adminNo); 
		
	
		response.setContentType("application/json; charset=utf-8");
		
		if(chatList.isEmpty()) {
			new Gson().toJson(chatList, response.getWriter());
		
		}else {
			
			new Gson().toJson(chatList, response.getWriter());
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
