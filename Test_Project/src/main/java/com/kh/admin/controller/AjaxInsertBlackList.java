package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;

/**
 * Servlet implementation class AjaxInsertBlackList
 */
@WebServlet("/insertBk.am")
public class AjaxInsertBlackList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInsertBlackList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int adminNo = Integer.parseInt(request.getParameter("admin"));
		int bkCount = Integer.parseInt(request.getParameter("bkCount"));
		
		int result = new AdminService().insertBlackList(memNo, adminNo, bkCount);
		if(result > 0) {
			request.setAttribute("alertMsg", "블랙리스트가 등록되었습니다!");
			response.sendRedirect("member.am?cpage=1");
		}else {
			request.getSession().setAttribute("errorMsg", "블랙 전송실패");
			response.sendRedirect("member.am?cpage=1");
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
