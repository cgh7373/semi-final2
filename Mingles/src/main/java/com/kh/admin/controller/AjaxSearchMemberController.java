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
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AjaxSearchMemberController
 */
@WebServlet("/searchMember.am")
public class AjaxSearchMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSearchMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String keyWord = request.getParameter("keyWord");
		
		ArrayList<Member> scMember = new AdminService().searchMember(keyWord);
			
		if(scMember.isEmpty()) {
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(scMember, response.getWriter());
		}else {
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(scMember, response.getWriter());
			
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
