package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminMember
 */
@WebServlet("/member.am")
public class AdminMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 페이징 처리
		int memberCount; 
		int currentPage;
		int pageLimit;
		int memberLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		memberCount = new AdminService().memberCount();
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		memberLimit = 10;
		
		maxPage = (int)Math.ceil((double)memberCount/memberLimit);
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(memberCount
								 , currentPage
								 , pageLimit
								 , memberLimit
								 , maxPage
								 , startPage
								 , endPage);
		// 전체회원 조회
		ArrayList<Member> list = new AdminService().selectMemberList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("memList", list);
		request.getRequestDispatcher("views/admin/adminMember.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
