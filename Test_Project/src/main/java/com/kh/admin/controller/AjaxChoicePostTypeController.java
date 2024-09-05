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
import com.kh.admin.model.vo.Post;

/**
 * Servlet implementation class AjaxChoicePostTypeController
 */
@WebServlet("/choicePostType.am")
public class AjaxChoicePostTypeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxChoicePostTypeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String postTN = request.getParameter("postType");  
		
		ArrayList<Post> postArr = new AdminService().choicePostType(postTN);
		
		if(postArr.isEmpty()) {
			
		}else {
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(postArr, response.getWriter());	
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
