package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.admin.model.service.AdminService;

/**
 * Servlet implementation class AjaxDeleteItemController
 */
@WebServlet("/deleteItem.am")
public class AdminDeleteItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteItemController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemNo = Integer.parseInt(request.getParameter("itemNo"));
		
		int result = new AdminService().deleteItem(itemNo);
		
		
		HttpSession session = request.getSession();
		
		if(result > 0 ) {
			session.setAttribute("alertMsg", "상품이 삭제 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/store.am");
		}else {
			session.setAttribute("errorMsg", "상품삭제에 실패했습니다");
			response.sendRedirect(request.getContextPath() + "/store.am");
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
